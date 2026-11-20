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

For Native GAMS, unzip an archive and open its `gams.json`. For GAMS Web, pass the tagged release asset URL as `showcase` in the launch URL. A fresh launch resets that demo; reload keeps saved edits. Close any other GAMS Web session on the same origin first.

Run `make package` with Make, Info-ZIP, `sqlite3`, and `shasum` to build the archives and checksums in `build.nosync/`. The SQL archive includes the database built from `sql/data/seed.sql`. Tilemap's editable atlas source is `tilemap/art/courtyard.aseprite`; the Project uses the exported QOI atlas. `make clean` removes disposable `build.nosync/`, `tools/`, and `gams_modules/` directories; requires Python 3. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
