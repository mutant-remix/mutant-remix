# Mutant Remix Build Files

This repository contains all of the files required to build a custom Mutant Remix package using Orxporter. A replacement for Orxporter is in the works.

Mutant Remix is not affiliated with [Mutant Standard](https://mutant.tech/). This is a transformation of the original Mutant Standard emoji pack, created by nizune for [Revolt](https://revolt.chat/).

## License

Everything directly in this repository is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/). Refer to separate licenses in the `assets`, `builder`, `coverage`, `font-builder` and `orxporter` submodules for their respective licenses.

## Using Export Scripts

To export Mutant Remix, clone this repository recursively or otherwise run:

```bash
git submodule init
git submodule update
```

### Script usage
You will need [these prerequisites in order to use them](https://gitlab.insrt.uk/revolt/mutant-remix/orxporter#prerequisites).

You also need to install the dependencies for `coverage`

```
cd coverage
yarn
cd ..
```

This repository has no warranty and has only been tested with Arch Linux. A docker version is in the works.

- Calculate unicode coverage
    - Generate `out/test_json/mtnt_test.json`
    - Generate `out/coverage/coverage.md`, `png` and `svg`
```
sh out_coverage.sh
```

- Short tests instead of building the full pack every time
```
sh out_test_png.sh
sh out_test_svg.sh
sh out_final_basic.sh
sh out_web_content_json.sh
```

- Build the full pack
```
sh out_final_full.sh
sh out_web_content.sh
```
