# fuzzy_cd for Fish shell

Replaces the `cd` command with a fuzzy searching version.

## Prerequisites

You'll definitely need to install `fasd`. This is easiest with Homebrew, just `brew install fasd`.

To make use of the jump marks, you'll want to install [this particular jump plugin](https://github.com/oh-my-fish/plugin-jump) (via `omf install jump`, probably). The `__fuzzy_cd` function doesn't actually use it for jumping, but my replacement for the `jump` function does not include any functions for adding or listing marks. This version of jump creates symlinks in `~/.marks`, which is what fuzzy cd is set up to read.

## Installation

Install with [fisher](https://github.com/jorgebucaran/fisher):

	fisher install ttscoff/fuzzy_cd

You can remove the plugin and restore `cd` to its built-in status using:

	fisher remove ttscoff/fuzzy_cd

## Usage

If there's only one argument to the `cd` command and it matches a valid path, `cd` will behave normally.

If the first argument is a jump bookmark, that will be used as the base directory. Bookmarks are fuzzy matched, so `cd bmark` would recognize a bookmark titled `bookmark` and use it.

Any additional arguments will be used to fuzzy search subdirectories in sequence. So `cd desk pod ov 8` would locate `~/Desktop/Podcasts/Overtired/268` and cd to it.

If the first argument is 3 or more dots, `cd` will navigate up the directory tree, allowing fuzzy directory searching from the base folder with additional arguments. 1 dot is the current directory, 2 dots is the next level up, each additional dot is one level further up. 3 dots is equivalent to `../..`, 4 dots is `../../..`, etc.

If no valid path is found using this method, `cd` will fall back to using fasd to search recent directories.
