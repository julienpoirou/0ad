# Vendored third-party assets

Provenance and integrity of every third-party file shipped by this project.
When updating the collection: replace the archive, update this table, and update
[THIRD_PARTY_LICENSES.md](THIRD_PARTY_LICENSES.md) if the upstream license changed.

All files live in `mods/`, one directory per mod, each holding the upstream
archive and the `mod.json` the engine reads.

**These files are not in git.** [.gitignore](.gitignore) excludes `mods/*`, so a
fresh clone contains no mod at all — only `mods/.gardien`, which keeps the
directory in the tree so `COPY mods/` still resolves at build time. The archives
below are redistributed through the published image
`julienpoirou/0ad:latest-mods`, not through this repository. Rebuilding the image
from a fresh clone therefore yields a mod-free image — which is exactly what
`julienpoirou/0ad:latest` is; restore the collection first with the tool
described under [How updates reach us](#how-updates-reach-us).

49 mods, 5.15 GiB. `mods/mod/` and `mods/public/` are **not**
listed: they belong to 0 A.D. itself, ship with the `0ad-data` package, and are
excluded from the image by [.dockerignore](.dockerignore).

| File | Mod | Version | License | SHA-256 |
|---|---|---|---|---|
| `0-AD-balancing/0-AD-balancing.zip` | Tweaks the resource types | 1.3 | — | `7a3a6cf27b5d725668e3318d5cebc75f009e35ab41e08897c6f89bae221e84db` |
| `0ad_Better_UI_A26/0ad_Better_UI_A26.zip` | 0ad_Better_UI_A26 | 0.26.0 | — | `1862c5a294509b51cd15a7e128750a3a7daf8f83ca0a55c8d1a1d08d85cf2a05` |
| `0ad_civilization_r28/0ad_civilization_r28.zip` | [0 A.D. Civilization Release 28](https://mod.io/g/0ad/m/civilization) | 0.28.0 | CC-BY-SA-3.0 + GPL-2.0 + GPL-3.0 | `ce1e98ff3a30e75fbe507269e2f61f665da4431d888a11d8532d99ccef521c75` |
| `0ad_delenda_est_r28/0ad_delenda_est_r28.zip` | [0 A.D. Delenda Est Release 28](https://github.com/JustusAvramenko/delenda_est) | 0.28.0 | CC-BY-SA-3.0 + GPL-3.0 | `fbfbc7f33cfc879f0c9be717cdabd91305dd90882321e86625404f6b65b51416` |
| `10ad/10ad.zip` | [10 A.D.](https://github.com/0ad-matters/10ad) | 0.28.0 | LGPL-2.1 | `fd277388655e6649ff8bb4075dd241cde5d0a83ab13dd2b686c74208982df3d3` |
| `3-points/3-points.zip` | [0 A.D. 3 Points Map](https://git.eurobytes.eu/imri/3_points) | 1.0.0 | — | `245e8de415e44ca66009c9155f69ebff10859c5079727c290d637018f54a7556` |
| `amberwood/` | Amberwood | 0.5.0 | — | `225d7a22b612ebe4217f05217a44c70d15801b05b41f749c690f10015d5054da` |
| `antiqua-maps/antiqua-maps.zip` | 0 A.D. Antiqua Maps | 0.26.5 | — | `2657b161407494c61067263680d97601ef1d52e1c3ff97f8a06de0bc093656cf` |
| `aristeia/aristeia.zip` | [Aristeia Bronziron : Peril of Nations](https://github.com/0ADMods/aristeia) | 0.28.0 | GPL-2.0 | `621a593cdf8ad79793479f55298f594de6e97bfc1017beffe21af7d52599205e` |
| `balance_test_mod/balance_test_mod.zip` | Balance Test | 0.1.0 | — | `bb5f6273ee4b56198d7545e5d2482ac25bdb380a56c19fc41b8d4855708392b7` |
| `better_scouting_A26/better_scouting_A26.zip` | Adds Scout units to Empires Ascendant. | 0.26.0 | — | `2a92812ea6005cbdccd4d6a502b6338c20953c43a83f95bc94196e13511f05f5` |
| `bigger-minimap/bigger-minimap.zip` | [Bigger Minimap](https://mod.io/g/0ad/m/bigger-minimap) | 0.28.0 | — | `d708889a34990929fa9e1557363c42577437bb4fce3355cc6507954a5685a1df` |
| `borg-expansion-pack/borg-expansion-pack.zip` | 0 A.D. Borg Expansion Pack - Alpha 23b | 1.0.6 | — | `cb76978653c9923ce36c0af454082382b0a9563dc9982a109ea3cf93d0c080dc` |
| `Bug_Fixes_0-28/Bug_Fixes_0-28.zip` | [Bug_Fixes_0-28](https://wildfiregames.com/forum/topic/140987-bug_fixes_028/) | 0.28.2 | — | `e02ca7bbe2b69fc00eddae65647c7c2af583caf5818d0ef79e56402ce6c35d76` |
| `circle-of-bosses/circle-of-bosses.zip` | [0 A.D. C.O.B. map](https://git.eurobytes.eu/imri/Circle_Of_Bosses) | 1.0.0 | — | `d399cd2c3e2296eb037fb50661b7d262234b35173f21a7cc59eaa079ea6ba686` |
| `classical-warfare-aea/classical-warfare-aea.zip` | [classical-warfare-aea](https://jeff-web-sketch.github.io/ClasicWareFareAEASite/) | 0.28.1 | — | `2cc21ebbcf272ad0890e25bf511b9d50351f443dda5078d4705b89ef4839c430` |
| `community-maps-2/community-maps-2.zip` | [Community Maps 2](https://github.com/0ad-matters/community-maps-2) | 0.28.0 | GPL-2.0 | `d380a9d314cc31b60b4ea1fd5dd41c94a9fa63c9d087f55b3128f65c84e0556d` |
| `community-mod/community-mod.zip` | [0 A.D. Community Mod](https://gitea.wildfiregames.com/0ad/0ad-community-mod) | 0.28.2 | — | `47f45157bd761266fcb0fddd7682f18ee6b9dd5a7c6cf70ae00042979e666aeb` |
| `deathmatch_gamemode/deathmatch_gamemode.zip` | Death Match Game Mode | 0.28.0 | MIT | `7025c0ed2e316d5cd63dd998f99b89fb038d645b9d1a5d4183d9e86ac399ea12` |
| `earth-maps/earth-maps.zip` | [Continental Maps for 0 A.D.](https://github.com/Baelish03/0ad-maps) | 0.28.3 | — | `68e06d982b33a3eb5a83a8d266e21b0bb72499aea641269c0312e36c6adc8b0e` |
| `feldmap/feldmap.zip` | [New random maps with balanced resources](https://wildfiregames.com/forum/topic/53880-feldmap/) | 3.0.1 | — | `a531d1eda468e90415974f8f56fa285294e6ed33a66d1255a464394e179ef47c` |
| `gametemplates/gametemplates.zip` | [Game Templates](https://gitea.wildfiregames.com/manowar/0ad) | 0.28 | — | `c37bd44123a50f90e4524231d8024ec79f137130c32a9c017a529c517c307632` |
| `grapejuice/grapejuice.zip` | gameplay overhaul, total rebalance, new skirmish randomiz… | 13 | GPL-2.0 | `6bbaef90c03a69ed7c3dae55b02844268fed9cf039fc3dcc06fb8184eea642de` |
| `havana/havana.zip` | Havana Map (4 Players) | 0.28.0 | — | `a430191ac78c5d067f2d3a124f0d3e5b11d58c21febed374ceaf020b9b1bcee9` |
| `hero-rebalance/hero-rebalance.zip` | [Hero Rebalance](https://wildfiregames.com/forum/topic/128429-mod-hero-rebalance/) | 0.5.0 | GPL-2.0 | `bab0d03c0f07d2669354aa246048c3d4fa395f278644c1691a554d56f649485d` |
| `hyrule-conquest-revival/hyrule-conquest-revival.zip` | [Hyrule Conquest: Revival](https://wildfiregames.com/forum/topic/137228-the-return-of-hyrule-conquestmy-revival-of-the-undying-nephalims-mod/) | 0.13.1 | GPL-2.0 † | `4823b3d4be6e4e6011c5f8d22bd3b16fa56609878a83f64c87b02d0a654eb0b4` |
| `jmod/jmod.zip` | Jaggeds Mod - More Resource to gather | 0.1.3 | — | `f9e1bc3abc398ebc55693489fb5c962eeedb2c725d1e609d73115bac2be2d730` |
| `kush-extreme/kush-extreme.zip` | [Kush Extreme](https://github.com/0ad-matters/kush-extreme) | 0.28.0 | LGPL-2.1 | `e1fca571ce72b906da14c48f93de2b88a2df92fc645fe5ea13ad7a7b22cb12a9` |
| `legacy-of-antiquity/legacy-of-antiquity.zip` | Legacy of Antiquity | 0.3.1 | GPL-2.0 | `4ce216e708ff2ea4269d124c7ce0814f575250855693fda1422d8100434443b8` |
| `linux-libertine/linux-libertine.zip` | [Linux Libertine font](https://wildfiregames.com/forum/index.php?/topic/27584-linux-libertine) | 5.3.0 | GPL (unspecified version) † | `54f7f54b47d71830dc9cd80c37cd346da144a1c5c99624b464bc5d6df1ed5737` |
| `localratings/localratings.zip` | [LocalRatings](https://gitlab.com/mentula0ad/LocalRatings) | 0.28.1 | GPL-3.0 | `2248d80b21e807fb6b3d38b9afa254383f02ffa60de6b53bb85966f7d447f3a1` |
| `mainland-twilight/mainland-twilight.zip` | [Mainland Twilight](https://github.com/Haroldgomez777/mainland-twilight) | 0.3.4 | — | `c6bbc6ad86d8461d3d7aeb25e9a34873fc881d2c536f9d2d1b7f2b464031815c` |
| `millenniumad/millenniumad.zip` | [Millennium A.D.](https://github.com/0ADMods/millenniumad) | 0.28.5 | GPL-2.0 | `9674962d2660f7eb3198db4726a393ce0f1a0f6551a5b58a5fe4ddb9177655fd` |
| `mirror/mirror.zip` | An impressive 0 A.D mod. | 0.25.7 | — | `f4db32036a8717377738ea005a1de1685c1c36b97d92e17b67252ef24a58458d` |
| `ModernGUI/ModernGUI.zip` | [ModernGUI](https://gitlab.com/4trik/ModernGUI) | 0.28.18 | — | `737292ba8a242c4fcdc915bed57a83ced705d387d6c0bafd36dda28993f5ce91` |
| `no-blood-and-gore-mod/no-blood-and-gore-mod.zip` | [No gore mod](https://github.com/0ADMods/no-blood-and-gore-mod) | 0.28.1 | GPL-2.0 | `7d6fad0c0a425c268764ca3e12f6cc9acd18685ffad533b0d4b379aaa2f3ce67` |
| `pirate_raids/pirate_raids.zip` | [Pirate Raids](http://tobydustin.com) | 0.1 | — | `306dcdca9b749c8bf6a3f032c829821a0a3eb0ff4a28a18ce2b05effd2662a31` |
| `ponies-ascendant/ponies-ascendant.zip` | [Ponies Ascendant](https://github.com/0ADMods/ponies_ascendant) | 0.28.2 | — | `ed78f7ae72f31fc6394ca11822face2f3b56918516ea8609006eb331bb70754c` |
| `quicklobby/quicklobby.zip` | Quick Lobby | 0.0.1 | — | `1fc91a6a32b3966ab4abc268c1b0df1449e6ecf32c820efe36378120668006da` |
| `r28-bot/r28-bot.zip` | [R28 Bot](https://wildfiregames.com/forum/topic/140620-mod-r28-bot-bot-for-the-release-version-of-the-game-with-advanced-settings/) | 0.2.0 | GPL-2.0 | `61fe8bf85f759c3963c70c8c492783107f7a5602e0da0c87b2c6857f183da587` |
| `ResizeQueue/ResizeQueue.zip` | [Resize Queue](https://gitlab.com/4trik/resizequeue) | 0.0.7 | — | `175fe005897d441ffdc180fa7e0142de3cd8fde1aaa51a83ae250376f00b457e` |
| `special-builders/special-builders.zip` | Special Builders | 0.0.2 | — | `4e6cfa8805c64530e2dcaee85e317830b92d8bec0fb414f55e5e94cd14b9dca2` |
| `survivorsmod/survivorsmod.zip` | Survivors Mod | 1.0.0 | — | `b856fa52e1d4edff32c3f64412362cae3f132b8b36859d0575faa044a91a9ed5` |
| `terra_magna_A26/terra_magna_A26.zip` | [0 A.D. Terra Magna](https://0ad.old.mod.io/terra-magna) | 0.26.2 | GPL-2.0 | `d7424e819b27f2be034c3cf38614f11eed3bf83b27ed4779b59948c5be3c39d8` |
| `theban-greeks/theban-greeks.zip` | [Theban Greeks](https://github.com/JustusAvramenko/theban_greeks) | 0.28.0 | CC-BY-SA-3.0 | `9c1e04762be1355e22e21aaad49998353b5aced0a845e946a8e35d1ccb01bb3e` |
| `tower_defense/tower_defense.zip` | [Tower Defense](https://github.com/0ADMods/tower-defense) | 0.28.0 | — | `429a45bd8b34b46e837be80c4a9be4f8ecaf267a367597f6457bb021e5ea14a1` |
| `two_gendered_citizens/two_gendered_citizens.zip` | Two-Gendered Citizens for 0 A.D. | 0.26.0 | — | `d13f9778725a544e6f96055943f15cb6b41f7dad4d4eeb92ae93e95fa30a990f` |
| `xiiiad/xiiiad.zip` | [XXI Century AD](https://github.com/0ADMods/xiiiad/) | 0.28.0 | — | `a00891094be6bca4d0879708f9c400d3351e5499a87cec1fe2f6863c1f20c179` |
| `xorberax-tonemap-shader/xorberax-tonemap-shader.zip` | Xorberax's Tonemap Shader | 0.1.0 | — | `8d29d3716e43e070131a7b6968f7bc58d8a440f351d590f9c09fa99eea36cbca` |

† The license file found in the archive covers only a subdirectory of the mod
(`art/`, `audio/` or `fonts/` — assets inherited from the base game or a
third-party font), not the mod as a whole. See
[THIRD_PARTY_LICENSES.md](THIRD_PARTY_LICENSES.md).

— No license file in the archive and no license field in `mod.json`
(31 of 49 mods). The mod.io API carries no license metadata
either, so nothing about these can be asserted from the files themselves.

## Source

Every mod comes from **mod.io**, over the same channel the game's built-in
downloader uses: [scripts/download-mods-modio](scripts/download-mods-modio)
reads the endpoint, the public API key and the game id from the `[modio.v1]`
section of `/usr/share/games/0ad/config/default.cfg` inside the image, rather
than hard-coding them, so a game update carries them along.

The `url` recorded in each `mod.json` above is the one its author
declared; 18 of the 49 mods declare none. For those, the mod.io
profile is recorded per mod id in `mods/.modio.json`, the journal the downloader
writes. That journal is not committed either — rerun the downloader to
regenerate it.

## Integrity

The checksums above were computed from the committed working tree, and are
the reference for what the image ships.

Upstream integrity is checked at download time, not from this table: mod.io
publishes an MD5 per file, and the downloader verifies each archive against it
while streaming, discarding any archive that fails rather than installing it.
A network cut is recovered by rerunning the command — an already-installed mod
is skipped.

4 entries are stored as a **file tree** instead of a single
archive (`amberwood`, `autisticus-maps`, `gametemplates-0.28.3`, `quicklobby-0.28.2`).
Their `File` cell ends in `/` and their SHA-256 is a tree digest: the SHA-256 of
each file, prefixed by its path relative to the mod directory, concatenated in
sorted path order and hashed again. It is not the checksum of any single file,
so `sha256sum` cannot reproduce it directly — use the script under
[Verifying integrity](#verifying-integrity).

## How updates reach us

mod.io is not a package registry: no Renovate datasource covers it, and its
`version` strings are not comparable to one another — `1.3`, `13`, `0.25.01`
and `test` all occur in this very catalogue. What *is* comparable is the
upstream file id, so that is what
[mods.lock.json](mods.lock.json) pins, one entry per mod.

From there everything is automated:

* [`.github/workflows/mods-watch.yml`](.github/workflows/mods-watch.yml) polls
  mod.io daily and, when a `modfile_id` moves, opens a pull request carrying
  **one Conventional Commit per mod** — so each mod appears by name in the
  changelog of the next game release.
* Merging it triggers
  [`.github/workflows/publish.yml`](.github/workflows/publish.yml), which
  re-downloads exactly what the lockfile pins, refuses to build if upstream
  moved in the meantime, regenerates the table below, and republishes the
  `-mods` variant.

The archives themselves are still not committed — 6 GiB will not go into git —
so the lockfile is what makes a build reproducible.

Refreshing the collection by hand stays possible, and stays replayable — the
tool skips what is already installed:

```bash
docker exec -i 0ad python3 - --list < scripts/download-mods-modio  # dry run
docker exec -i 0ad python3 - < scripts/download-mods-modio
docker restart 0ad
```

An archive is a single `.zip` or `.pyromod` file, whereas the engine only loads
a directory containing a `mod.json`. [scripts/normalize-mods-0ad](scripts/normalize-mods-0ad)
does that conversion; a `.pyromod` left as-is is ignored **without any message**:

```bash
docker exec -i 0ad python3 - < scripts/normalize-mods-0ad
docker restart 0ad
```

Then copy the result back into `mods/`, refresh this table, and rebuild:

```bash
docker build -t julienpoirou/0ad:latest .
```

The table below is generated, not maintained by hand:

```bash
scripts/generate-vendored           # regenerate it
scripts/generate-vendored --check   # exit 1 if it is stale
```

Everything in it is derived from `mods/` and each `mod.json` — except the
**License** column, which comes from reading the license file inside each
archive and is carried over row by row, never overwritten. A mod that appears
for the first time lands with `—` and needs a human to look.

## Verifying integrity

For a mod stored as an archive:

```bash
sha256sum mods/<mod>/<mod>.zip
```

For every entry at once, tree digests included:

```bash
python3 - <<'EOF'
import hashlib, os
RACINE = "mods"
def sha(p):
    h = hashlib.sha256()
    with open(p, "rb") as f:
        for bloc in iter(lambda: f.read(1 << 22), b""):
            h.update(bloc)
    return h.hexdigest()
for nom in sorted(os.listdir(RACINE)):
    d = os.path.join(RACINE, nom)
    if not os.path.isdir(d) or nom in ("mod", "public", "user"):
        continue
    arcs = [f for f in os.listdir(d) if f.endswith((".zip", ".pyromod"))]
    if len(arcs) == 1:
        print(sha(os.path.join(d, arcs[0])), nom + "/" + arcs[0])
        continue
    h = hashlib.sha256()
    fichiers = [(os.path.relpath(os.path.join(b, n), d).replace("\\", "/"),
                 os.path.join(b, n))
                for b, _, ns in os.walk(d) for n in ns]
    for rel, p in sorted(fichiers):
        h.update(rel.encode() + b"\0" + sha(p).encode() + b"\0")
    print(h.hexdigest(), nom + "/")
EOF
```

## First-party files

Under this repository's [LICENSE](LICENSE) (MIT): the `Dockerfile`, everything
under `root/` (the launchers `root/defaults/autostart` and
`root/defaults/autostart_wayland`, the init script
`root/custom-cont-init.d/20-mods-0ad`), the four tools in `scripts/`, and
the documentation.

`root/defaults/user-high.cfg` and `root/defaults/user-low.cfg` are
first-party too, but their content is 0 A.D. configuration keys, meaningful only
to the game that reads them.
