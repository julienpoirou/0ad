FROM ghcr.io/linuxserver/baseimage-selkies:ubuntunoble AS base

ARG DEBIAN_FRONTEND=noninteractive

# OCI image spec labels, dynamic values injected at build time via --build-arg
ARG VERSION=dev
ARG BUILD_DATE
ARG GIT_REVISION

LABEL org.opencontainers.image.title="0ad" \
      org.opencontainers.image.description="0 A.D. is a free, open-source, historical Real Time Strategy (RTS) game currently under development by Wildfire Games, a global group of volunteer game developers." \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.revision="${GIT_REVISION}" \
      org.opencontainers.image.authors="julienpoirou" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.base.name="linuxserver/baseimage-selkies:ubuntunoble"

# Installing 0ad via the official Wildfire Games repository
# hadolint ignore=DL3005
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ca-certificates gpg-agent software-properties-common \
    && add-apt-repository -y ppa:wfg/0ad \
    && apt-get update \
    && apt-get install -y --no-install-recommends 0ad libgl1-mesa-dri mesa-utils \
    && apt-get purge -y --auto-remove software-properties-common gpg-agent linux-libc-dev libc6-dev libc-dev-bin python3-pip-whl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && rm -f /usr/libexec/docker/cli-plugins/docker-buildx

# Selkies image currently omits this runtime dependency; the other pins close
# the remaining Trivy findings against /lsiopy's venv:
# Pillow: CVE-2026-54058/54059/54060/55379/55380/59197/59199/59200/59204/59205
# cryptography: CVE-2026-69247 (HIGH, Bleichenbacher oracle in pkcs7_decrypt_*)
# aiohttp: CVE-2026-69244 (HIGH), CVE-2026-59881, CVE-2026-69243
# pip: CVE-2026-13346/8643/6357/3219/1703, CVE-2025-8869
# setuptools: CVE-2026-59890
RUN /lsiopy/bin/python3 -m pip install --no-cache-dir --upgrade \
    distro==1.9.0 Pillow==12.3.0 cryptography==50.0.2 aiohttp==3.14.3 \
    pip==26.2.1 setuptools==83.0.0

# Open the 0 A.D. window fullscreen rather than maximised
RUN grep -q '<windowRule identifier="\*"><action name="Maximize" /></windowRule>' /defaults/labwc.xml \
    && sed -i 's|<windowRule identifier="\*"><action name="Maximize" /></windowRule>|<windowRule identifier="*"><action name="ToggleFullscreen" /></windowRule>|' /defaults/labwc.xml \
    && grep -q '<windowRule identifier="\*"><action name="ToggleFullscreen" /></windowRule>' /defaults/labwc.xml

# Selkies zero-copy stream pipeline runs on Wayland
ENV PIXELFLUX_WAYLAND=true

# Enables the graphics stack for native Linux
ENV NVIDIA_DRIVER_CAPABILITIES=all

# Brand the browser tab and PWA
ENV TITLE=0ad

# Game launcher, 0 A.D. defaults, and the project favicon
COPY root/ /

# root/ ships a loose gui/pregame/userreport/userreport.xml that hides the main
# menu feedback panel (0 A.D. gives on-disk files priority over public.zip).
# This guard fails the build if a game update restructures the upstream panel,
# so the override never silently masks a changed or broken GUI object set.
RUN /lsiopy/bin/python3 -c "import zipfile,sys; d=zipfile.ZipFile('/usr/share/games/0ad/mods/public/public.zip').read('gui/pregame/userreport/userreport.xml').decode(); req=['name=\"userReport\"','name=\"userReportText\"','name=\"userReportEnableButton\"','name=\"userReportTermsButton\"']; sys.exit(0 if all(x in d for x in req) else 1)"

# Browser interface
EXPOSE 3000 3001

# 0 A.D. multiplayer
EXPOSE 20595/udp

# Liveness/readiness probe for orchestrators (Compose, Kubernetes, Swarm)
HEALTHCHECK --interval=30s --timeout=5s --start-period=60s --retries=3 \
    CMD ["curl", "-fsS", "http://127.0.0.1:3000/"]

# Variant with the full mod collection
FROM base AS mods

COPY mods/ /usr/share/games/0ad/mods/

# Mod-free variant
FROM base AS game
