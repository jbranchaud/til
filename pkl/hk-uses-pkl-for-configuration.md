# hk Uses Pkl For Configuration

[`hk`](https://hk.jdx.dev/) is one of those fancy, new Rust-based CLI tools that
manages hooks for doing all kinds of checks on a codebase. Here is the result of
me running the interactive initializer for various linters and checkers in a
Ruby codebase.

```bash
❯ hk init --interactive
Select linters Infrastructure/actionlint, Ruby/brakeman, Ruby/bundle_audit, Ruby/fasterer, Ruby/herb_format, Ruby/herb_lint, Ruby/standard_rb
Select hooks to configure pre-commit
hk Created hk.pkl
hk Next: run `hk check --all` to try it, then `hk install` to set up hooks
```

Notice it says `Created hk.pkl`. That's a [Pkl (pronounced pickle)](https://pkl-lang.org/index.html) file.

> Pkl is a special-purpose language designed for configuration tasks. It is
> scalable and safe, combining the declarative nature of static data formats
> with the expressivity and safety of a statically-typed programming language.
> Pkl code can generate JSON, YAML, and other static configurations; it can also
> be embedded as a library into an application runtime.

Here is the contents of the file it generates:

```pkl
amends "package://github.com/jdx/hk/releases/download/v2.13.0/hk@2.13.0#/Config.pkl"
import "package://github.com/jdx/hk/releases/download/v2.13.0/hk@2.13.0#/Builtins.pkl"
// Using a coding agent? See https://hk.jdx.dev/agents

local linters = new Mapping {
    ["actionlint"] = Builtins.actionlint
    ["brakeman"] = Builtins.brakeman
    ["bundle_audit"] = Builtins.bundle_audit
    ["fasterer"] = Builtins.fasterer
    ["herb_format"] = Builtins.herb_format
    ["herb_lint"] = Builtins.herb_lint
    ["standard_rb"] = Builtins.standard_rb
}

steps = linters
```

That's a 15-line configuration file that pulls in a bunch of standard checks for
a Ruby project. Between the `amends` and `import` lines, this configuration
gets expanded into a MUCH larger definition of the config.

```bash
❯ pkl eval -f json hk.pkl | wc -l
     744
```

The JSON equivalent when that `pkl` file gets evaluated is 744 lines.
