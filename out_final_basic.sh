#!/bin/bash
cd "$(dirname "$0")"
source ./config.sh

# get orxporter to do its thing
./orxporter/orxport.py -m assets/manifest/out.orx -i ../svg -C cache -q 32x32 -r resvg -o out/final/codepoint -f %f/%u -t ${threads} -F svg,pngc-32,pngc-128,pngc-512   &&
./orxporter/orxport.py -m assets/manifest/out.orx -i ../svg -C cache -q 32x32 -r resvg -o out/final/shortcode -f %f/%d/%s -t ${threads} -F svg,pngc-32,pngc-128,pngc-512  &&
./orxporter/orxport.py -m assets/manifest/out.orx -i ../svg -C cache -q 32x32 -r resvg -o out/final/mastodon -f ms_%s -t ${threads} -F pngc-128

source ./out_coverage.sh
