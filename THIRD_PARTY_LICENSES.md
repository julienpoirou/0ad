# Third-party licenses

Third-party software redistributed by the image `julienpoirou/0ad:latest`.
Versions, sources and checksums for the mod collection: [VENDORED.md](VENDORED.md).

This repository is [MIT](LICENSE), but the image it builds is not. It bundles
GPL-licensed software. The MIT license covers the first-party files listed at the
end of [VENDORED.md](VENDORED.md), nothing more.

## Shipped in the image

| Software | Upstream | Version in the image | License |
|---|---|---|---|
| 0 A.D. engine | <https://gitea.wildfiregames.com/0ad/0ad> | `0ad` 0.28.0-1ubuntu0.24.04~wfg2 | GPL-2.0-or-later © 2000-2025 Wildfire Games for `Files: *`, ten more expressions per path, see [Packages that are not single-license](#packages-that-are-not-single-license) |
| 0 A.D. game data (art, audio, maps) | <https://releases.wildfiregames.com/> | `0ad-data` 0.28.0-1~wfg1 | CC-BY-SA-3.0 © Wildfire Games for `Files: *`, GPL-2+ on a few files |
| 0 A.D. data shared across versions | <https://releases.wildfiregames.com/> | `0ad-data-common` 0.28.0-1~wfg1 | same as `0ad-data` |
| LinuxServer.io Selkies base image | <https://github.com/linuxserver/docker-baseimage-selkies> | `ubuntunoble` (Ubuntu 24.04 LTS) | GPL-3.0-or-later |
| Selkies | <https://github.com/selkies-project/selkies> | bundled by the base image | MPL-2.0 |
| pixelflux | <https://github.com/linuxserver/pixelflux> | bundled by the base image | MPL-2.0 |
| labwc | <https://github.com/labwc/labwc> | bundled by the base image | GPL-2.0 |
| s6-overlay | <https://github.com/just-containers/s6-overlay> | bundled by the base image | ISC |
| Mesa (DRI drivers, `zink`, `d3d12`, `llvmpipe`) | <https://gitlab.freedesktop.org/mesa/mesa> | see installed package metadata | MIT for `Files: *`, fifteen more expressions per path, see [Packages that are not single-license](#packages-that-are-not-single-license) |
| mesa-utils | <https://gitlab.freedesktop.org/mesa/mesa-demos> | see installed package metadata | MIT by default, SGI MIT-style on the SGI demos, GPL on the Debian packaging |
| Ubuntu base packages | <https://ubuntu.com/> | 24.04 LTS (noble) | per package, see `/usr/share/doc/*/copyright` |

The three 0 A.D. packages come from the Wildfire Games PPA (`ppa:wfg/0ad`),
not from the Ubuntu archive.

### Packages that are not single-license

Several entries above bundle work under many licenses at once. Naming only the
default would be misleading, so here is what each one actually contains, read
from the image itself rather than summarised.

**`0ad`**, `Files: *` is GPL-2.0+, and that covers the engine proper. Eleven
distinct expressions appear across the package: Apache-2, BSD-3-clause,
CC-BY-SA-3.0, CPL, Expat, GPL-2.0, GPL-2.0+, LGPL-2.1, LGPL-2.1+, MPL-2.0, and
`MPL-2.0 and GPL-2.0 and LGPL-2.1` for one bundled component.

**`0ad-data`, `0ad-data-common`**, `Files: *` is CC-BY-SA-3.0; a few files are
GPL-2+. Both packages carry the same two expressions.

**Mesa** (`libgl1-mesa-dri`, `libglx-mesa0`), `Files: *` is MIT, which is also
the default the upstream project states. Sixteen expressions appear across the
package: Apache-2.0, `Apache-2.0 OR MIT`, BSD-2-clause, BSD-3-google, BSL, GPL,
GPL-1+, GPL-2, `GPL-2 or MIT`, Khronos, MIT, `MIT OR Apache-2.0`,
`(MIT OR Apache-2.0) AND Unicode-DFS-2016`, MLAA, SGI and Unicode-DFS-2016. The
GPL-covered paths are the Debian packaging and three kernel UAPI headers under
`include/drm-uapi/`, not the drivers themselves.

**`mesa-utils`**, its copyright file is upstream prose, not Debian's
machine-readable format, so there is no `Files: *` to read. It states that the
core library is MIT and that "some of the Mesa source code is copyrighted by
SGI, some of the Mesa device drivers are copyrighted by their authors", then
lists the components: the SGI and RedBook demos under an SGI MIT-style license,
the other demos under their own per-file notices. The Debian packaging is GPL.


The authoritative breakdowns are inside the image:

```bash
docker run --rm --entrypoint cat julienpoirou/0ad:latest /usr/share/doc/0ad/copyright
docker run --rm --entrypoint cat julienpoirou/0ad:latest /usr/share/doc/libgl1-mesa-dri/copyright
docker run --rm --entrypoint cat julienpoirou/0ad:latest /usr/share/doc/mesa-utils/copyright
```

Because the image redistributes GPL binaries, anyone publishing it is bound by
the corresponding source obligations. Those sources are the unmodified upstream
packages, available from the PPA and the projects listed above. This project
patches none of them.

## The mod collection

All third-party mods, listed one by one in [VENDORED.md](VENDORED.md). They are
**not** covered by this repository's license, and their authors are not
affiliated with this project.

If you are an author who wants a mod removed or correctly attributed,
open an issue: see [.github/SECURITY.md](.github/SECURITY.md) for contact.

### Where each license was found

`†` in [VENDORED.md](VENDORED.md) marks the rows where the file covers only a
subdirectory. That happens for two reasons: a mod reusing base-game assets keeps
Wildfire Games' `art/license.txt` or `audio/LICENSE.txt` (CC-BY-SA-3.0), and a
mod shipping a font keeps that font's own license (OFL-1.1 for Source Han Sans,
GPL for Linux Libertine). Neither says anything about the rest of the mod.

| Mod | License | File in the archive | Scope |
|---|---|---|---|
| `0ad_civilization_r28` | CC-BY-SA-3.0 | `Delenda Est Contributors and License.txt` | the whole mod |
| `0ad_civilization_r28` | CC-BY-SA-3.0 | `art/LICENSE.txt` | that directory only |
| `0ad_civilization_r28` | GPL-2.0 | `Aristeia License.txt` | the whole mod |
| `0ad_civilization_r28` | GPL-3.0 | `Delenda Est Contributors and License.txt` | the whole mod |
| `0ad_delenda_est_r28` | CC-BY-SA-3.0 | `Contributors and License.txt` | the whole mod |
| `0ad_delenda_est_r28` | CC-BY-SA-3.0 | `art/license.txt` | that directory only |
| `0ad_delenda_est_r28` | GPL-3.0 | `Contributors and License.txt` | the whole mod |
| `10ad` | LGPL-2.1 | `LICENSE` | the whole mod |
| `aristeia` | CC-BY-SA-3.0 | `art/LICENSE.txt` | that directory only |
| `aristeia` | GPL-2.0 | `License.txt` | the whole mod |
| `autociv` | GPL-3.0 | `LICENSE` | the whole mod |
| `autocivp` | GPL-3.0 | `LICENSE` | the whole mod |
| `bot_PETRA_Expert` | GPL-2.0 | `LICENSE` | the whole mod |
| `city-building-mod` | MIT | `LICENSE` | the whole mod |
| `community-maps-2` | GPL-2.0 | `LICENSE` | the whole mod |
| `deathmatch_gamemode` | MIT | `License.MD` | the whole mod |
| `gods-eye-mod` | CC-BY-SA-3.0 | `audio/LICENSE.txt` | that directory only |
| `grapejuice` | GPL-2.0 | `license.txt` | the whole mod |
| `hero-rebalance` | GPL-2.0 | `LICENSE` | the whole mod |
| `hyrule-conquest-revival` | GPL-2.0 | `docs/License.txt` | that directory only |
| `incas-0ad` | CC-BY-SA-3.0 | `art/LICENSE.txt` | that directory only |
| `incas-0ad` | GPL-2.0 | `LICENSE` | the whole mod |
| `ja-lang` | OFL-1.1 | `fonts/SourceHanSans-LICENSE.txt` | that directory only |
| `ko-lang` | OFL-1.1 | `fonts/SourceHanSans-LICENSE.txt` | that directory only |
| `kush-extreme` | LGPL-2.1 | `LICENSE` | the whole mod |
| `legacy-of-antiquity` | GPL-2.0 | `license_gpl-2.0.txt` | the whole mod |
| `letsfight` | GPL-2.0 | `LICENSE` | the whole mod |
| `linux-libertine` | GPL (unspecified version) | `fonts/LICENCE.txt` | that directory only |
| `localratings` | GPL-3.0 | `COPYING` | the whole mod |
| `millenniumad` | CC-BY-SA-3.0 | `art/license.txt` | that directory only |
| `millenniumad` | GPL-2.0 | `License.txt` | the whole mod |
| `modiomod` | GPL-2.0 | `License.txt` | the whole mod |
| `no-blood-and-gore-mod` | GPL-2.0 | `LICENSE` | the whole mod |
| `no-gather` | LGPL-2.1 | `LICENSE` | the whole mod |
| `r28-bot` | GPL-2.0 | `license_gpl-2.0.txt` | the whole mod |
| `random_civ_groups` | GPL-3.0 | `LICENSE` | the whole mod |
| `shiny` | CC-BY-SA-3.0 | `LICENSE.txt` | the whole mod |
| `shiny` | GPL-2.0 | `license_gpl-2.0.txt` | the whole mod |
| `siege` | GPL-3.0 | `license.txt` | the whole mod |
| `techtree` | GPL-2.0 | `License.txt` | the whole mod |
| `terra_magna_A26` | CC-BY-SA-3.0 | `art/LICENSE.txt` | that directory only |
| `terra_magna_A26` | GPL-2.0 | `license.txt` | the whole mod |
| `theban-greeks` | CC-BY-SA-3.0 | `license.txt` | the whole mod |
| `volatile-market` | CC-BY-SA-3.0 | `art/LICENSE.txt` | that directory only |
| `volatile-market` | GPL-2.0 | `LICENSE` | the whole mod |
| `zh-lang` | OFL-1.1 | `fonts/SourceHanSans-LICENSE.txt` | that directory only |
| `zh-tw-lang` | OFL-1.1 | `fonts/SourceHanSans-LICENSE.txt` | that directory only |

One restriction is carried by none of the licenses above. `0ad_delenda_est_r28`,
and `0ad_civilization_r28` which bundles its files, state in
`Contributors and License.txt`, right after pointing code and artwork at
CC-BY-SA-3.0 and GPL-3.0:

> Music: Do not edit any of the music. Must give credit to Derek & Brandon
> Fiechter and Tyler Cunningham if reused.

Redistributing those two mods unchanged, as this image does, satisfies it.
Reusing their music elsewhere does not fall under CC-BY-SA-3.0.

## Full license texts

Every license text quoted above ships inside the image, next to the software it
covers:

```bash
# 0 A.D. engine and data, file-by-file breakdown
docker run --rm --entrypoint cat julienpoirou/0ad:latest /usr/share/doc/0ad/copyright
docker run --rm --entrypoint cat julienpoirou/0ad:latest /usr/share/doc/0ad-data/copyright


# common license texts referenced by the Debian copyright files
docker run --rm --entrypoint ls julienpoirou/0ad:latest /usr/share/common-licenses
```

A mod's own license text is inside its archive, at the path given in the table
above:

```bash
unzip -p mods/<mod>/<mod>.zip <path>
```
