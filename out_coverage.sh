#!/bin/bash
cd "$(dirname "$0")"

mkdir -p ./out/test_json ./coverage/data ./out/coverage

./orxporter/orxport.py -m assets/manifest/out.orx -j out/test_json/mtnt_test.json

cp out/test_json/mtnt_test.json ./coverage/data/mtnt_test.json
wget https://raw.githubusercontent.com/googlefonts/emoji-metadata/main/emoji_15_0_ordering.json -P ./coverage/data

cd coverage
yarn
yarn start
cp ./out/* ../out/coverage

cd "$(dirname "$0")"
