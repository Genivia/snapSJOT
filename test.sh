#!/bin/bash

cd dev

cp -f snapsjot.js node_modules/snapsjot/index.js
echo 'module.exports = snapSJOT;' >> node_modules/snapsjot/index.js

node test.js
