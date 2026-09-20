# Contributing

Thanks for your interest in **0ad in Docker** 💙

## Prerequisites
- Docker

## Getting started
```bash
git clone https://github.com/julienpoirou/0ad
cd 0ad
docker build --no-cache -t 0ad:dev .
docker run -d --name 0ad --restart unless-stopped `
  --shm-size=2g `
  -p 127.0.0.1:8088:3000 `
  -p 20595:20595/udp `
  -v ${PWD}\profil\config:/config/.config/0ad/config `
  -v ${PWD}\profil\saves:/config/.local/share/0ad/saves `
  -v ${PWD}\profil\replays:/config/.local/share/0ad/replays `
  -v ${PWD}\profil\screenshots:/config/.local/share/0ad/screenshots `
  --gpus all `
  0ad:dev
```

## Branches & commits
- Branch off `main`: `feat/x`, `fix/y`, etc.
- **Conventional Commits** required:
  - `feat(scope): ...` (minor)
  - `fix(scope): ...` (patch)
  - `feat!(scope): ...` or `refactor!: ...` (major)
- CI enforces the format via **commitlint**.

## Open a PR
- Fill the PR template.
- Checklist: tests green, lint OK, docs updated.
- No need to edit `CHANGELOG.md` or the version: **Release Please** will do it.

## Discussion
- Questions: issues or discussions.
- First contributions welcome: **good first issue** label.
