#!/bin/bash
set -e
set -o pipefail

SKIPS="SC1071,SC2034,SC2004,SC2015"

(
# find all executables and run `shellcheck`
for f in $(find . -type f -not -iwholename '*.git*' | sort -u); do
	if file "$f" | grep --quiet shell; then
		shellcheck "$f" -S error -e "${SKIPS}" && echo "[OK]: sucessfully linted $f"
	fi
done
)
