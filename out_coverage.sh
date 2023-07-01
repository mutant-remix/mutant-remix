#!/bin/bash
cd "$(dirname "$0")"

# Prepare directories
mkdir -p ./out/test_json ./coverage-calculator/data ./out/unicode-coverage

# Get mutant remix emoji data
./orxporter/orxport.py -m assets/manifest/out.orx -j out/test_json/mtnt_test.json
cp out/test_json/mtnt_test.json ./coverage-calculator/data/mtnt_test.json

# Get unicode emoji data
wget https://raw.githubusercontent.com/googlefonts/emoji-metadata/main/emoji_15_0_ordering.json -P ./coverage-calculator/data

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
