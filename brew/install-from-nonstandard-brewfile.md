# Install From Nonstandard Brewfile

When you want to install the packages listed in the `Brewfile` for your current
project (or dotfiles), you can run:

```bash
$ brew bundle
```

And `brew` knows to look for and use the `Brewfile` in the current directory.

If, however, you are trying to run `brew bundle` for a `Brewfile` located
somewhere besides the current directory *OR* you want to target a file with a
non-standard name (like
[`Brewfile.personal`](https://github.com/jbranchaud/dotfiles/blob/main/Brewfile.personal)),
then you can use the `--file` flag.

```bash
$ brew bundle --file Brewfile.personal
```

This is what I do [here in my `dotfiles`
repo](https://github.com/jbranchaud/dotfiles/blob/b053f6251cae7ed52f698fc2a2c40ba82c5881b0/installer/mac-setup.sh#L42-L48).

See `man brew` and find the section on `brew bundle` for more details.
