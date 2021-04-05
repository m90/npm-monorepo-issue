#!/bin/sh

echo "Running repro using npm version $(npm -v)"

(cd packages/pkg1 && rm -rf node_modules)
(cd app1 && rm -rf node_modules && npm i)
(cd app1 && npm start)
