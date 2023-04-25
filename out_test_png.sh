#!/bin/bash
cd "$(dirname "$0")"
source ./config.sh

./orxporter/orxport.py -m assets/manifest/out.orx -i ../svg -C cache -q 32x32 -o out/test_png/shortcode -r resvg -f %d/%s -t ${threads} -F png-128 -l
