#!/bin/sh
# May need to add --random-wait if we get detected and blocked.
# Tweak "level" as necessary to limit recursion.

if [ $# -lt 3 ]; then
    echo "Usage: start-URL domain filename "
    echo "(no need for filename extensions, will be added automatically)"
    exit 1
fi

wget \
    --mirror \
    --warc-file=$3 \
    --warc-max-size=100M \
    --warc-cdx \
    --page-requisites \
    --html-extension \
    --convert-links \
    --execute robots=off \
    --directory-prefix=. \
    --no-directories \
    --delete-after \
    --span-hosts \
    --no-parent \
    --level=1 \
    --user-agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36" \
    --domains=$2 \
    $1
