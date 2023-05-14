<a href="https://mutant.revolt.chat">
    <img src="https://raw.githubusercontent.com/mutant-remix/.github/master/assets/banner.png" style="margin: 20px 0; width: 80%"></img>
</a>

# Contributing
This is a comprehensive guide on how to contribute to Mutant Remix and help us achieve full unicode coverage. Mutant Remix welcomes contributions from everyone.

Potential contributors are encouraged to read this guide **in full**.

<a href="https://github.com/mutant-remix/unicode-coverage/blob/master/coverage.md">
    <img src="https://raw.githubusercontent.com/mutant-remix/unicode-coverage/master/coverage.png" style="width: 50%"></img>
</a>

Check the [coverage table](https://github.com/mutant-remix/coverage-report/blob/master/coverage.md) to see what emojis are missing in the pack.

## General notes
- High quality contributions are preferred over quantity
- Emojis must follow the [design guidelines](https://github.com/mutant-remix/specification) and fit with the rest of the pack
- Commit names must follow the [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) specification.
> In most cases, `feat: <something> #<issue number>` or `fix: <something> #<issue number>`.
- Your contributions will be licensed under the [CC BY-NC-SA 4.0](https://github.com/mutant-remix/assets/blob/master/LICENSE) license and your name will be added to the [contributors list](./CONTRIBUTORS.md) (if you wish)

## Communities
We encourage you to join our communities to discuss the changes you want to make, and to get help if you need it.

- On Discord https://discord.gg/SkM2XppTrR
- On [Revolt](https://revolt.chat) https://rvlt.gg/kcTDntf1

## Setting up the workspace
This guide assumes general familiarity with git and the command line. If you are not familiar with these, you should [join the communities](#communities) listed above and ask for help.

### Cloning the repository
- Fork the [mutant-remix repository](https://github.com/mutant-remix/mutant-remix) to your own account

- Clone your fork of the `mutant-remix` repository **recursively** to get the submodules
```bash
git clone --recursive https://github.com/YOUR-USERNAME/mutant-remix
cd mutant-remix
```

You will then be able to add emojis to your fork and open a pull request to have it merged into Mutant Remix.

### Building the pack
**You may not need to do this step.** CI will automatically build the pack for you when you open the PR and check for errors. This is only needed if you want to test your changes locally before opening a PR. Continue with the [adding content](#adding-content) section if you'd like to skip this step.

- Install the required dependencies as described in [README/prerequisites](./README.md#dependencies)
- Try building the project to make sure everything is working as described in [README/basic usage](./README.md#basic-usage)

## Issues
Open an issue before working on anything. This way we can discuss the changes you want to make and make sure they fit with the project and that somebody else isn't working on the same thing as you. This is to make sure you don't waste your time working on something that won't be merged.

## Adding content
Check out the [general notes](#general-notes) section before adding content.

The [coverage table](https://github.com/mutant-remix/coverage-report/blob/master/coverage.md) contains a list of all emojis that are in the scope of this pack with their corresponding unicode codepoints and **links to relevant emojipedia searches**.

### Avoiding merge conflicts
It is recommended to pull the latest changes before making any changes to avoid merge conflicts. If you are working on a fork, sync it with the upstream repository before making any changes.

### Workflow
- Check the [issues](https://github.com/mutant-remix/mutant-remix/issues) to see if that emoji is already being worked on. If an issue is tagged with "help wanted", it means that it is open for anyone to work on. Comment on the issue to let everyone know that you are working on it.
- Open an issue on the [mutant-remix repository](https://github.com/mutant-remix/mutant-remix)

For example:
> **Add tricolor flag emojis**
>
> The tricolor flag emojis are missing from the pack. I would like to add them.
>
> Codepoints: `1F3F4` `E0067` `E0062` `E0073` `E0063` `E0074` `E007F`
- If you are not sure that your issue is valid, you can wait for feedback from the maintainers before working on it to make sure you don't waste your time.

### Attribution
If you wish to be included in the [contributors list](./CONTRIBUTORS.md), you can add your name to it in your PR. Same PR is fine, but use separate commits for the actual content and the attribution.

### Structure
Emojis consist of two parts:
- The SVG file located in `./assets/svg/<category>/<subcategory>/<name>.svg`
- The metadata located in `./assets/manifest/emoji/<category>/<subcategory>.orx`

### Design software
You can use any software you want to create the SVG files, but we recommend using [Inkscape](https://inkscape.org/) as it is free and open source. If you are more comfortable with other software, you can use that instead.

Make sure that the SVG files are exported with settings optimized for file size (i.e. no unnecessary metadata).

### Metadata
Refer to existing metadata for examples of how to write metadata and check out the [metadata guide for orxporter](https://github.com/mutant-remix/orxporter/blob/master/docs/kiilas/manifest.md) for syntax information.

### Naming
The name of the emoji should (usually) be the same as in the coverage table, but with underscores instead of spaces. For example, `:grinning_face:` would be `grinning_face.svg`.

### Non-unicode emojis
If you want to add an emoji that is not in the coverage table, you may do so. However, it will not be included in the codepoint version of the pack, but only in the shortcode version. Don't make up codepoints for emojis that don't have them, but you can make up shortcodes for them.

### Codepoints
For repeating codepoints, you should use a variable, such as `$zwj` and `$vs16`. You do not need to define these variables yourself.

```
$zwj = #200d
$vs16 = #fe0f
```

### Color variations
If some emojis are just color variations of each other (for example, skin tones, some flags, colored shapes), you should consider making a template emoji with no color of it's own. Then, you may use colormaps in the metadata to color it during the build process. This will make sure that the emojis are consistent with each other and that they are all updated when one of them is changed, as well as keep the structure of the project more tidy.
