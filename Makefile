.DEFAULT_GOAL := package
.DELETE_ON_ERROR:
DEMOS := tilemap aseprite sql nodegraph markov bulletml track code nine voxel world font animation image respack
ARCHIVES := $(addprefix build.nosync/,$(addsuffix .zip,$(DEMOS)))
FILES_tilemap := gams.json maps/courtyard.qoi maps/courtyard.tilemap.json
FILES_aseprite := gams.json art/firefly.aseprite
FILES_sql := gams.json data/seed.sql
FILES_nodegraph := gams.json graphs/tree.ng.lua nodes/generate-tree.lua nodes/save-tree.lua
FILES_markov := gams.json rules/island.xml
FILES_bulletml := gams.json patterns/spiral.bulletml.json
FILES_track := gams.json tracks/sunset-circuit.svg
FILES_code := gams.json scripts/wave.js
FILES_nine := gams.json art/panel.png art/panel.nine.json
FILES_voxel := gams.json models/watchtower.vox
FILES_world := gams.json pause.world.json art/panel.png art/panel.nine.json art/world-example.arfont art/press-start-2p.OFL.txt
FILES_font := gams.json fonts/Anton-Regular.ttf fonts/Anton.OFL.txt
FILES_animation := gams.json firefly.animation.json art/firefly.aseprite
FILES_image := gams.json art/ui-atlas.png art/crop-view.js
FILES_respack := gams.json graphs/encounter.ng.lua nodes/build-pack.lua assets/schema.json assets/slots.json

.PHONY: package clean
package: $(ARCHIVES) build.nosync/SHA256SUMS

build.nosync/seed/data/items.sqlite: sql/data/seed.sql Makefile
	@mkdir -p "$(@D)"
	@set -eu; stage="$@.tmp"; rm -f "$$stage"; trap 'rm -f "$$stage"' EXIT; \
		sqlite3 -batch -bail "$$stage" < "$<"; mv "$$stage" "$@"

.SECONDEXPANSION:
build.nosync/%.zip: $$(addprefix %/,$$(FILES_$$*)) LICENSE NOTICE Makefile
	@mkdir -p "$(@D)"
	@set -eu; stage="$@.tmp.zip"; rm -f "$$stage"; trap 'rm -f "$$stage"' EXIT; \
		(cd "$*" && zip -q -X "../$$stage" $(FILES_$*)); \
		if [ "$*" = sql ]; then (cd build.nosync/seed && zip -q -X "../../$$stage" data/items.sqlite); fi; \
		zip -q -X "$$stage" LICENSE NOTICE; mv "$$stage" "$@"

build.nosync/sql.zip: build.nosync/seed/data/items.sqlite

build.nosync/SHA256SUMS: $(ARCHIVES)
	cd "$(@D)" && shasum -a 256 $(notdir $(ARCHIVES)) > SHA256SUMS

clean:
	python3 -B scripts/clean.py
