# Tell gh What The Default Repo Is

I recently forked [dkarter/dotfiles](https://github.com/dkarter/dotfiles) as a
way of bootstrapping a robust dotfile config for a new machine that I could
start making customizations to. I'm maintaining a `my-dotfiles` branch and keep
things in sync with the original upstream repo.

When trying to go to *my* fork of the repo
([jbranchaud/dotfiles](https://github.com/jbranchaud/dotfiles)) in the web with
the `gh` CLI tool, I ran into a weird issue. It was instead opening up to
`dkarter/dotfiles`.

`gh` was under the wrong impression which repo should be considered the default.
To clarify things for `gh`, there is a command to set the default repo.

```bash
$ gh repo set-default jbranchaud/dotfiles
✓ Set jbranchaud/dotfiles as the default repository for the current directory
```

Now when I run `gh repo view --web`, it opens the browser to my fork of the
dotfiles.

But where does this setting live?

Opening this repo's `.git/config` file I can see a section for the `origin`
remote that includes a new line for `gh-resolved`. This being set to `base`
tells `gh` that this remote is the one to treat as the default repo.

```
[remote "origin"]
	url = git@github.com:jbranchaud/dotfiles.git
	fetch = +refs/heads/*:refs/remotes/origin/*
	gh-resolved = base

```

See `gh repo set-default --help` for more details.
