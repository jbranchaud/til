# Break Justfile Into Separate Hidden Steps

With `just` and a project's `justfile`, I can get a summary of the commands
available to run against my project by running `just --list`. If I try to
breakdown a complex, multi-step command into separate `just` commands, it will
be nice for organization, but it will clutter the list output. I can mark
specific commands as hidden or internal by preceding them with an underscore
(`_`).

Here is a `justfile` from one of my projects that only lists a single command
`setup` which itself is supported by three internal commands: `_check-brew`,
`_install-deps`, and `_install-go-tools`.

```justfile
# Install all required development dependencies
setup: _check-brew _install-deps _install-go-tools

# Check if brew is installed
_check-brew:
    #!/usr/bin/env bash
    if ! command -v brew &> /dev/null; then
        echo "Error: Homebrew is not installed"
        echo "Please install from https://brew.sh"
        exit 1
    fi

brew_deps := '''
    go
    sqlite3
'''

# Install brew dependencies
_install-deps:
    #!/usr/bin/env bash
    deps=$(echo '{{brew_deps}}' | tr -s '[:space:]' ' ' | xargs)
    for pkg in $deps; do
        if ! brew list $pkg &>/dev/null; then
            echo "Installing $pkg..."
            brew install $pkg
        else
            echo "✓ $pkg already installed"
        fi
    done

# Install Go development tools
_install-go-tools:
    go install github.com/pressly/goose/v3/cmd/goose@latest
```
