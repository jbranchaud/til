# Install Go Packages In Brewfile

Typically my `Brewfile` is only full of `brew` and `cask` directives. That's
starting to change now that `brew` supports installing Go packages listed in the
`Brewfile`.

Use the `go` directive and the URL to the hosted Go package.

Here is an example of a `Brewfile` that includes a `cask`, `brew`, and `go`
directive.

```
# screen resolution tool
cask "betterdisplay"

# Mac keychain management, gpg key
brew "pinentry-mac"

# Sanitized production Postgres dumps
go "github.com/jackc/pg_partialcopy"
```

I've recently added the exact package from above to my [`dotfiles`
repo](https://github.com/jbranchaud/dotfiles/commit/e83e9d19504f0e2f95eba33123f907f999bf865e).

Here is the [PR to `brew`](https://github.com/Homebrew/brew/pull/20798) where
this functionality was added back in October of 2025.
