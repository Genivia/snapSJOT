#!/bin/bash

# script used by package.json and executed with npm commands:
#   npm version patch
#   npm version minor
#   npm version major
# followed by:
#   npm publish

# get version after version bump
VERSION=`npm list --depth=0 | sed -n 's/^[^@]*@\([^ ]*\) .*$/\1/p'`
echo "Creating snapsjot $VERSION"

cd dev

# bump version and remove DEBUG[ ... DEBUG]
sed -e "s/{VERSION}/$VERSION/" -e "s/DEBUG\[.*DEBUG\]//g" -e "/DEBUG\[/,/DEBUG\]/ d" < snapsjot.js > ../dist/snapsjot.js

# create index.js by adding module.exports
cp -f ../dist/snapsjot.js ../index.js
echo 'module.exports = snapSJOT;' >> ../index.js

# create travis-test.js
cp -f ../dist/snapsjot.js ../travis-test.js
tail +2 test.js >> ../travis-test.js
