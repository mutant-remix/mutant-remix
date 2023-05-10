<a href="https://mutant.revolt.chat">
    <img src="https://raw.githubusercontent.com/mutant-remix/.github/master/assets/banner.png" style="margin: 20px 0; width: 80%"></img>
</a>

This repository contains all of the files required to build a custom Mutant Remix package using Orxporter.

Mutant Remix is not affiliated with [Mutant Standard](https://mutant.tech/). This is a transformation of the original Mutant Standard emoji pack, created by nizune for [Revolt](https://revolt.chat/).

## Download
You can download the latest release of Mutant Remix from the [releases page](https://github.com/mutant-remix/mutant-remix/releases)

Alternatively, you can [build it yourself](#building)

## Contributing
If you would like to contribute to Mutant Remix, please read the [CONTRIBUTING guide](./CONTRIBUTING.md).

You can see the full list of contributors in [CONTRIBUTORS](./CONTRIBUTORS.md).

## Communities
- On Discord https://discord.gg/SkM2XppTrR
- On [Revolt](https://revolt.chat) https://rvlt.gg/kcTDntf1

## Building
> This guide assumes general familiarity with git and the command line. If you are not familiar with these, you should [join the communities](#communities) listed above and ask for help.

To build Mutant Remix, clone this repository recursively.

```bash
git clone --recursive https://github.com/mutant-remix/mutant-remix
```

> If you did not clone recursively, you can run `git submodule update --init --recursive` to fetch the submodules.

### Dependencies
This repository has no warranty and has only been tested with Arch Linux. If you are using a different distribution (or Windows), check out the [Docker](#docker) section.

You will need:
- [Orxporter prerequisites](https://github.com/mutant-remix/orxporter#prerequisites)
- [Node.js](https://nodejs.org/en/) + `yarn`
- `wget`

```bash
sudo pacman -S --needed \
    base-devel wget \ # you likely have this installed already
    python python-pip \ # for running orxporter
    nodejs yarn \ # for running coverage-calculator
    oxipng perl-image-exiftool svgcleaner libwebp # orxporter dependencies

pip install -r ./orxporter/requirements.txt

cd coverage-calculator
yarn install

cd ..
```

### Docker
If you are not running Arch Linux, you can use a [Docker](https://www.docker.com/) container to build Mutant Remix. This is the recommended way to build Mutant Remix on Windows (or other Linux distributions).

```bash
cd mutant-remix
docker run -it --rm -v ./:/mutant-remix archlinux:latest /bin/bash
cd /mutant-remix
```

### Basic usage
The first-time build is going to take 3-15 minutes (depending on your CPU). Subsequent builds will be several times faster, as only the changed files will be rebuilt.
```bash
sh out_final_full.sh
```

If everything worked, you will find the built pack in `./out/final-pkg`

Note that **you do not need to build the full pack every time**. A script more suited for development is `./out_test_svg.sh`, which is much faster.
```bash
sh out_test_svg.sh
```

### Other scritps
```bash
sh out_coverage.sh
sh out_test_png.sh
sh out_final_basic.sh
sh out_web_content_json.sh
sh out_web_content.sh
```

## License
Everything directly in this repository is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/). Refer to separate licenses in the `assets`, `coverage-calculator`, `forc` and `orxporter` submodules for their respective licenses.
