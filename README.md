# GAMS Showcases

Sample Projects for [GAMS](https://gams.z0.lv/). Each archive contains `gams.json` and its sample files. Project Units install from pinned releases on first launch.

| Project | Try it | Release asset |
| --- | --- | --- |
| [Tilemap](tilemap/) | Paint terrain or move trees on their own layer. | `tilemap.zip` |
| [Aseprite](aseprite/) | Play the firefly animation and toggle the Shadow layer. | `aseprite.zip` |
| [SQL](sql/) | Run `SELECT name, price FROM items WHERE rarity = 'rare' ORDER BY price;`. | `sql.zip` |
| [Nodegraph](nodegraph/) | Run the graph, edit `nodeCount` on the Settings node, then run again. Open `tree-output.json` from Files to inspect the result. | `nodegraph.zip` |
| [MarkovJunior](markov/) | Step or play an island growth rule; change the seed and compare. | `markov.zip` |
| [BulletML](bulletml/) | Play a spiral game pattern, pause, and step one frame at a time. | `bulletml.zip` |
| [Track](track/) | Move a control point on Sunset Circuit and save the edited SVG. | `track.zip` |
| [Code](code/) | Edit and save the timed spawn schedule in `wave.js`. | `code.zip` |
| [Nine-slice](nine/) | Adjust the stretch region of a dialog panel and save the slice metadata. | `nine.zip` |
| [Voxel](voxel/) | Orbit and zoom around a MagicaVoxel watchtower. | `voxel.zip` |
| [World](world/) | Move a label or the selection highlight in an editable pause-menu scene. | `world.zip` |
| [Font](font/) | Change the preview text or atlas type and regenerate a distance-field atlas from Anton. | `font.zip` |
| [Animation](animation/) | Select Rise or Glide to preview two tagged clips from the Firefly sprite. | `animation.zip` |
| [Image](image/) | Change the crop bounds and export a PNG from the sample atlas. | `image.zip` |
| [Resource Pack](respack/) | Run the graph to build `encounter.rspk` and an Odin decoder. | `respack.zip` |

For Native GAMS, unzip an archive and open its `gams.json`. For GAMS Web, pass the tagged release asset URL as `showcase` in the launch URL. A fresh launch resets that demo; reload keeps saved edits. Close any other GAMS Web session on the same origin first.

Run `make package` with Make, Info-ZIP, `sqlite3`, and `shasum` to build the archives and checksums in `build.nosync/`. The SQL archive includes the database built from `sql/data/seed.sql`. Tilemap's editable atlas source is `tilemap/art/courtyard.aseprite`; the Project uses the exported QOI atlas. `make clean` removes disposable `build.nosync/`, `tools/`, and `gams_modules/` directories; requires Python 3. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
