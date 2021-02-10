#!/bin/bash

./gradlew publish

echo "test" > foo.txt
v=$(git describe --tags --always --first-parent)

curl -XPOST -u "${GITHUB_ACTOR}:${GITHUB_TOKEN}" -T foo.txt "https://maven.pkg.github.com/asvoboda/funicular/org/asvoboda/${v}/funicular-$v.txt"
