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
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates gpg-agent software-properties-common \
    && add-apt-repository -y ppa:wfg/0ad \
    && apt-get update \
    && apt-get install -y --no-install-recommends 0ad libgl1-mesa-dri mesa-utils \
    && apt-get purge -y --auto-remove software-properties-common gpg-agent \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Selkies image currently omits this runtime dependency
RUN /lsiopy/bin/python3 -m pip install --no-cache-dir distro==1.9.0

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

# Variant with the full mod collection
FROM base AS mods

COPY mods/ /usr/share/games/0ad/mods/

# Mod-free variant
FROM base AS game
