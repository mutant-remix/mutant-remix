<a href="https://mutant.revolt.chat">
    <img src="https://raw.githubusercontent.com/mutant-remix/.github/master/assets/banner.png" style="margin: 20px 0; width: 50%"></img>
</a>

# Contributing
This is a comprehensive guide on how to contribute to Mutant Remix and help us achieve full unicode coverage. Mutant Remix welcomes contributions from everyone.

<a href="https://github.com/mutant-remix/unicode-coverage/blob/master/coverage.md">
    <img src="https://raw.githubusercontent.com/mutant-remix/unicode-coverage/master/coverage.png" style="width: 50%"></img>
</a>

Check the [coverage table](https://github.com/mutant-remix/coverage-report/blob/master/coverage.md) to see what emojis are missing in the pack.

## General notes
- High quality contributions are preferred over quantity
- Emojis must follow the [design guidelines](https://github.com/mutant-remix/specification) and fit with the rest of the pack
- Your contributions will be licensed under the [CC BY-NC-SA 4.0](https://github.com/mutant-remix/assets/blob/master/LICENSE) license and your name will be added to the [contributors list](./CONTRIBUTORS.md)

Open an issue before working on anything. This way we can discuss the changes you want to make and make sure they fit with the project and that somebody else isn't working on the same thing as you. This is to make sure you don't waste your time working on something that won't be merged.

## Communities
We encourage you to join our communities to discuss the changes you want to make, and to get help if you need it.

- On Discord https://discord.gg/SkM2XppTrR
- On [Revolt](https://revolt.chat) https://rvlt.gg/kcTDntf1

## Setting up the workspace
Building Mutant Remix is only supported on (Arch) Linux. If you are using Windows, [you can use WSL](https://learn.microsoft.com/en-us/windows/wsl/install).

Do note that for (code-wise) simple contributions such as adding new emojis, **setting up the entire workspace is not necessary**. You can just open a pull request with your changes and CI will automatically build the pack for you to check for errors.

> This guide assumes general familiarity with git and the command line. If you are not familiar with these, you should [join the communities](#communities) listed above and ask for help.

### Basic setup
This section only covers the basic setup required to add emojis to the pack and open a pull request. If you want to be able to build the entire pack locally, see the [full setup section](#full-setup).

- Fork the [assets repository](https://github.com/mutant-remix/assets) to your own account
- Clone your fork of the repository
```bash
git clone https://github.com/YOUR-USERNAME/assets
cd assets
```

Continue with the [adding content](#adding-content) section.

### Full setup
**You may not need to do this.** If you just want to add emojis to the pack, see the [basic setup section](#basic-setup).

- Fork the [mutant-remix repository](https://github.com/mutant-remix/mutant-remix) to your own account
- Clone your fork of the repository **recursively** to get the submodules
```bash
git clone --recursive https://github.com/YOUR-USERNAME/mutant-remix
cd mutant-remix
```

- Install the required dependencies as described in the [README](./README.md)
> This assumes that you are using Arch Linux. If you are using a different distribution (or Windows), you may use a Docker container or WSL. If you are confused, [join the communities](#communities) listed above and ask for help.
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

- Try building the project to make sure everything is working
> The first-time build is going to take 3-15 minutes (depending on your CPU). Subsequent builds will be several times faster, as only the changed files will be rebuilt.
```bash
./out_final_full.sh
```

- If everything worked, you will find the built pack in `./out/final-pkg`

> Note that you don't need to build the entire pack every time. You can use the `./out_test_svg.sh` script in most cases. Check out the [README](./README.md) for more information.

## Adding content
Check out the [general notes](#general-notes) section before adding content.

The [coverage table](https://github.com/mutant-remix/coverage-report/blob/master/coverage.md) contains a list of all emojis that are in the scope of this pack with their corresponding unicode codepoints and **links to relevant emojipedia searches**.

### Variations
If some emojis are just color variations of each other, you should consider using a template-type emoji (more info in [metadata](#metadata)) with no color of it's own, which will be colored during the build process according to the metadata. This will make sure that the emojis are consistent with each other and that they are all updated when one of them is changed, as well as keep the structure of the project more tidy.

### Structure
Emojis consist of two parts:
- The SVG file located in `./assets/svg/<category>/<subcategory>/<name>.svg`
- The metadata located in `./assets/manifest/emoji/<category>/<subcategory>.orx`

### Metadata
Check out the comprehensive [metadata guide for orxporter](https://github.com/mutant-remix/orxporter/blob/master/docs/kiilas/manifest.md) to learn more.

Refer to existing emojis for examples of how to write metadata and join the [communities](#communities) listed above if you need help.
