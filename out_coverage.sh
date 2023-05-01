#!/bin/bash
cd "$(dirname "$0")"

# Prepare directories
mkdir -p ./out/test_json ./coverage/data ./out/coverage

# Get mutant remix emoji data
./orxporter/orxport.py -m assets/manifest/out.orx -j out/test_json/mtnt_test.json
cp out/test_json/mtnt_test.json ./coverage/data/mtnt_test.json

# Get unicode emoji data
wget https://raw.githubusercontent.com/googlefonts/emoji-metadata/main/emoji_15_0_ordering.json -P ./coverage/data

# Get inter font
wget https://github.com/rsms/inter/releases/download/v3.19/Inter-3.19.zip -P ./coverage/data
unzip ./coverage/data/Inter-3.19.zip -d ./coverage/data/inter
mv ./coverage/data/inter/Inter\ Hinted\ for\ Windows/Desktop/Inter-SemiBold.ttf ./coverage/data/inter.ttf
rm -rf ./coverage/data/inter ./coverage/data/Inter-3.19.zip

# Go into coverage directory
cd coverage

# Install dependencies
yarn

# Run the program
yarn start

# Copy the output
cp ./out/* ../out/coverage

# Go back to the root directory
cd "$(dirname "$0")"
