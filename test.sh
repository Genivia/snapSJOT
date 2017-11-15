#!/bin/bash

cd dev

cp -f snapsjot.js node_modules/snapsjot/index.js
echo 'module.exports = SNAPSJOT;' >> node_modules/snapsjot/index.js

node test.js
