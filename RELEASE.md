# Release process

This repository does not have a release cadence of its own: it packages
0 A.D., so **one Release here means one version of the game**. No Release is
cut between two upstream versions, however many fixes, mod updates or
dependency bumps land on `main` in the meantime — they all accumulate into the
changelog of the next game version.

## What triggers a Release

`GAME_VERSION` holds the upstream version, and nothing else does:

```
0.28.0 # x-release-please-version
```

`release-please.yml` runs **only** when that file changes
(`on.push.paths: [ 'GAME_VERSION' ]`). Without that restriction it would
propose `0.28.1` on the first `fix:` commit — a version number the game does
not have.

1. `upstream-watch.yml` polls
   <https://gitea.wildfiregames.com/0ad/0ad/releases> daily, skipping drafts,
   prereleases and `-rc`/`-alpha`/`-beta` tags.
2. A new stable version opens a PR (label `upstream`) that writes it into
   `GAME_VERSION`, with a `Release-As:` footer so release-please uses the
   game's number instead of computing an increment.
3. Merging that PR makes **Release Please** open a Release PR carrying the
   version bump and the accumulated `CHANGELOG.md`.
4. Merging the Release PR creates the tag and the GitHub Release.
5. `release.published` triggers **Publish**.

Check before merging step 2 that `ppa:wfg/0ad` has actually published the new
version for Ubuntu Noble — the `Dockerfile` pins no version and takes whatever
the PPA serves.

## SemVer mapping

Only relevant to the changelog sections; the version number itself comes from
`GAME_VERSION`.

- `feat:` → **minor**.
- `fix:` → **patch**.
- `type!:` or a "BREAKING CHANGE" note → **major**.

## What Publish does

`publish.yml` builds and pushes both variants to **both** registries
(`ghcr.io/julienpoirou/0ad` and `docker.io/julienpoirou/0ad`):

| Variant | Target | Tags |
|---|---|---|
| Game only | `--target game` | `0.28.0`, `0.28`, `latest`, `0.28.0-<YYYYMMDD-HHMM>` |
| Game + mods | `--target mods` | `0.28.0-mods`, `0.28-mods`, `latest-mods`, `0.28.0-mods-<YYYYMMDD-HHMM>` |

The two variants share every layer but the mods one. The timestamped tags are
the only ones never moved, and Docker Hub enforces that: the repository has
*Specific tags are immutable* set to

```
^[0-9]+\.[0-9]+\.[0-9]+(-mods)?-[0-9]{8}-[0-9]{4}$
```

The timestamp carries the hour because two publishes can land on the same day
— the upstream pull request merging, then the Release being published a few
hours later. A day-granular tag would make the second push collide with an
immutable tag and fail the job. Publishes are serialised by the `publish`
concurrency group and take longer than a minute, so minute granularity is
enough.

It also runs on `push` to `main` (when `Dockerfile`, `root/**`,
`mods.lock.json` or `GAME_VERSION` change), on a weekly cron so base-image
CVEs get rebuilt, and on `workflow_dispatch`.

## Release assets

**The images are not attached to the Release.** GitHub caps an asset at 2 GB
and the `-mods` variant is around 6 GiB; the registries are the distribution
channel. The Release carries what identifies that build instead:

- `references.txt` — the `@sha256:` digests of both variants, the only truly
  immutable references;
- `sbom.spdx.json` and `trivy-image.txt`;
- `mods.lock.json` — the exact mod files the `-mods` variant was built from.

## Secrets

- **GitHub Registry**: nothing to configure, `GITHUB_TOKEN` with
  `packages: write` is enough.
- **Docker Hub**: `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN`. Publish skips
  Docker Hub entirely when either is missing, GHCR still gets both variants.
- **mod.io**: no secret. The API key is the public one shipped in
  `/usr/share/games/0ad/config/default.cfg`, extracted from the image at build
  time — the same channel the game's own downloader uses.
