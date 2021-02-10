#!/bin/bash

./gradlew publish

echo "test" > foo.txt
v=$(git describe --tags --always --first-parent)

curl -XPUT -u "${GITHUB_ACTOR}:${GITHUB_TOKEN}" -T foo.txt "https://maven.pkg.github.com/asvoboda/funicular/org/asvoboda/funicular/${v}/funicular-$v.txt"
