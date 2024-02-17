# Select A Specific Rails Version To Install

We can install a specific Rails version with `gem` using the version flag.

```bash
$ gem install rails --version 7.1.3
```

That's only if we already know which specific version we are intending to
install.

A better version of this would show us a list of available version and let us
select the one we want.

We can do this by fetching all remote Rails versions with `gem`, splitting that
output up into a single version per line, and then piping that to an `fzf`
prompt. The version we navigate to and select will be fed into the `gem
install` command.

```bash
gem install rails --version $(
  gem list rails --exact --remote --all \
  | sed -n 's/.*(\([^)]*\)).*/\1/p' \
  | tr ',' '\n' \
  | sed 's/^ //' \
  | fzf
)
```
