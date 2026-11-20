# GAMS Showcases

Editable Projects for [GAMS](https://gams.z0.lv/), packaged with sample content.

| Project | Try it | Release asset |
| --- | --- | --- |
| [Tilemap](tilemap/) | Paint grass, paths and water on the Ground layer, or move trees on their own layer. | `tilemap.zip` |

In Native GAMS, unzip the release archive and open its `gams.json`. From a source checkout, open `tilemap/gams.json` directly. Project Units install from pinned releases on first launch. The editable atlas source is `tilemap/art/courtyard.aseprite`; the Project uses the exported QOI atlas.

In GAMS Web, pass the tagged release asset URL as `showcase` in the launch URL. A fresh launch resets that demo; reload keeps your edits. Close any other GAMS Web session on the same origin first.

Run `make package` with Make, Info-ZIP and `shasum` to build the archives and checksums in `build.nosync/`. `make clean` removes disposable `build.nosync/`, `tools/` and `gams_modules/` directories; requires Python 3. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
