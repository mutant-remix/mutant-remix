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
This repository has no warranty and has only been tested with Arch Linux. If you are using a different distribution (or Windows), check out the [non-arch](#non-arch) section.

You will need:
- [Orxporter prerequisites](https://github.com/mutant-remix/orxporter#prerequisites)
- [Node.js](https://nodejs.org/en/) + `yarn`
- `wget`

```bash
# Install base packages
sudo pacman -Syu --needed \
    wget \
    python python-pip \ # for running orxporter
    nodejs yarn \ # for running coverage-calculator
    rustup \ # for installing resvg
    oxipng perl-image-exiftool svgcleaner libwebp # orxporter dependencies

# You may experience issues if you use resvg from the AUR
# It is recommended to use cargo
rustup install stable # install rust/cargo
cargo install resvg # orxporter dependency

# Install orxporter and forc dependencies
pip install -r ./orxporter/requirements.txt
pip install -r ./forc/requirements.txt

# Install coverage-calculator dependencies
cd coverage-calculator
yarn install

cd ..
```

### Non-arch
**If you are not running Arch Linux** (Windows or another distribution), here are the alternatives:

#### Docker
You can use Docker to run the build scripts in an Arch Linux container. This works on Windows and Linux. For Mac OS, check out the [manual](#manual) section.

```bash
cd mutant-remix
docker run -it --rm -v ./:/mutant-remix docker.io/archlinux:latest /bin/bash
cd /mutant-remix
```

> You can use Podman instead of Docker. The command is the same, just `podman` instead of `docker`.

Then follow the [dependencies](#dependencies) section.

#### Manual
If you do not want to use an Arch Linux container, you can install the dependencies manually.

Package names may vary depending on your distribution and alternatives will only be provided for Debian/Ubuntu and Mac OS.

Arch Linux package | Debian/Ubuntu | Mac OS
--- | --- | ---
`wget` | `apt install wget` | `brew install wget`
`libwebp` | `apt install webp` | `brew install webp`
`perl-image-exiftool` | `apt install libimage-exiftool-perl` | `brew install exiftool`
`libpng-dev` | `apt install libpng-dev` | `brew install libpng`
`python python-pip` | `apt install python3 python-pip` | `brew install python`
`nodejs` | [Node Version Manager](https://github.com/nvm-sh/nvm) + `nvm install node` | `brew install node`
`yarn` | `npm install -g yarn` | `brew install yarn`
`rustup` | [Rustup](https://rustup.rs/) | `brew install rustup`
`svgcleaner` | `cargo install svgcleaner` | `cargo install svgcleaner`
`oxipng` | `cargo install oxipng` | `cargo install oxipng`

> You may experience issues if you use `svgcleaner` and `resvg` from your distribution's repositories. It is recommended to use the `cargo` versions.

Then follow the [dependencies](#dependencies) section, skipping the `pacman` step.

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
Everything directly in this repository is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/). Refer to separate licenses in the `coverage-calculator`, `forc` and `orxporter` submodules for their respective licenses.
