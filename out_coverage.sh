#!/bin/bash
cd "$(dirname "$0")"

mkdir -p out/test_json
./orxporter/orxport.py -m assets/manifest/out.orx -j out/test_json/mtnt_test.json

cp out/test_json/mtnt_test.json ./coverage/data/mtnt_test.json

mkdir -p ./out/coverage

cd coverage
yarn start
cp -r ./out ../out/coverage

cd "$(dirname "$0")"
