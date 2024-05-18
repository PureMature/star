#!/bin/bash

set -eu
set -o pipefail

DIR=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
cd "$DIR"

mkdir -p markdown

# for all text files under text/, build the corresponding markdown files in markdown/
for i in text/*.txt; do
    name=${i#text/}
    stub=${name%.txt}
    mdfile=markdown/"$stub".md
    printf "✍️ Building %s...\n" "$stub"
    outline template --template doc_template.txt "$i" > "$mdfile"
    markdownfmt -soft-wraps -w "$mdfile"
done
