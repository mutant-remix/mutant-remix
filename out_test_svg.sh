#!/bin/bash
cd "$(dirname "$0")"

./orxporter/orxport.py -m assets/manifest/out.orx -i ../svg -C cache -q 32x32 -o out/test_svg/codepoint -f %u  &&
./orxporter/orxport.py -m assets/manifest/out.orx -i ../svg -C cache -q 32x32 -o out/test_svg/shortcode -f %d/%s
