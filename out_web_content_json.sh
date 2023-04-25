#!/bin/bash
cd "$(dirname "$0")"

./orxporter/orxport.py -m assets/manifest/out.orx -J out/web_content/emoji.json
