#!/bin/bash

./gradlew publish

v=$(git describe --tags --always --first-parent)
echo "testing v ${v}" > foo.txt

tar -zcvf foo.tgz foo.txt

curl -XPUT -u "${GITHUB_ACTOR}:${GITHUB_TOKEN}" -T foo.txt "https://maven.pkg.github.com/asvoboda/funicular/org/asvoboda/funicular/${v}/funicular-$v.txt"
curl -XPUT -u "${GITHUB_ACTOR}:${GITHUB_TOKEN}" -T foo.txt "https://maven.pkg.github.com/asvoboda/funicular/org/asvoboda/funicular/${v}/funicular-$v.tgz"
