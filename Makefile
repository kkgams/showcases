.DEFAULT_GOAL := package
.DELETE_ON_ERROR:
ARCHIVES := build.nosync/tilemap.zip
TILEMAP_FILES := gams.json maps/courtyard.qoi maps/courtyard.tilemap.json

.PHONY: package clean
package: $(ARCHIVES) build.nosync/SHA256SUMS

build.nosync/tilemap.zip: $(addprefix tilemap/,$(TILEMAP_FILES)) LICENSE NOTICE Makefile
	@mkdir -p "$(@D)"
	@set -eu; stage="$@.tmp.zip"; rm -f "$$stage"; trap 'rm -f "$$stage"' EXIT; \
		(cd tilemap && zip -q -X "../$$stage" $(TILEMAP_FILES)); \
		zip -q -X "$$stage" LICENSE NOTICE; mv "$$stage" "$@"

build.nosync/SHA256SUMS: $(ARCHIVES)
	cd "$(@D)" && shasum -a 256 $(notdir $(ARCHIVES)) > SHA256SUMS

clean:
	python3 -B scripts/clean.py
