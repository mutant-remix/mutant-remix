#!/bin/bash
cd "$(dirname "$0")"

# Prepare directories
mkdir -p ./out/test_json ./coverage/data ./out/coverage

# Get mutant remix emoji data
./orxporter/orxport.py -m assets/manifest/out.orx -j out/test_json/mtnt_test.json
cp out/test_json/mtnt_test.json ./coverage-calculator/data/mtnt_test.json

# Get unicode emoji data
wget https://raw.githubusercontent.com/googlefonts/emoji-metadata/main/emoji_15_0_ordering.json -P ./coverage-calculator/data

# Get inter font
wget https://github.com/rsms/inter/releases/download/v3.19/Inter-3.19.zip -P ./coverage/data
unzip ./coverage-calculator/data/Inter-3.19.zip -d ./coverage-calculator/data/inter
mv ./coverage-calculator/data/inter/Inter\ Hinted\ for\ Windows/Desktop/Inter-SemiBold.ttf ./coverage-calculator/data/inter.ttf
rm -rf ./coverage-calculator/data/inter ./coverage-calculator/data/Inter-3.19.zip

# Go into coverage directory
cd coverage-calculator

# Install dependencies
yarn

# Run the program
yarn start

# Copy the output
cp ./out/* ../out/unicode-coverage

# Go back to the root directory
cd "$(dirname "$0")"
