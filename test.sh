#!/usr/bin/env bash
set -e

SKIPS="SC1071,SC2034,SC2004,SC2015"

find . -type f \( -name '*.sh' -o -name '*.bash' \) -not -path '*/.git/*' -print0 |
    xargs -0 -r shellcheck -S error -e "${SKIPS}" -P scripts/bin