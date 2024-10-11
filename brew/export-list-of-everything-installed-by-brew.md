# Export List Of Everything Installed By Brew

If you're on a Mac using Homebrew to install various tools and utilities, there
may come a time when you want a listing of what is installed.

Run this command:

```bash
$ brew bundle dump
```

It may take 10 or so seconds. When it is done, you'll have a `Brewfile` in your
current directory.

Open it up and you'll see a bunch of lines like the following:

```
tap "heroku/brew"
tap "homebrew/bundle"
tap "homebrew/services"
tap "mongodb/brew"
tap "planetscale/tap"
tap "stripe/stripe-cli"
brew "asdf"
brew "bat"
brew "direnv"
brew "entr"
brew "exa"
brew "fd"
brew "ffmpeg"
brew "fx"
brew "fzf"
brew "gcc"
brew "gh"
brew "planetscale/tap/pscale"
brew "stripe/stripe-cli/stripe"
cask "1password-cli"
vscode "ms-playwright.playwright"
vscode "ms-vsliveshare.vsliveshare"
vscode "prisma.prisma"
```

Notice there are `tap`, `brew`, `cask`, and even `vscode` directives.

This is a file you could export and then run on a 'new' machine to install all
the programs you're used to having available on your current machine.

[source](https://danmunoz.com/setting-up-a-new-computer-with-homebrew/)
