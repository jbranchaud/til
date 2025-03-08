# Preserve Color Output For Task Command

I decided to wrap a couple test running commands for a project into a single
`test:all` mise task. It looked something like this:

```toml
[tasks."test:all"]
run = """
bundle exec rspec
yarn test run
"""
description = "Run all tests (RSpec and Vitest)"
depends = ["bundle-install", "node-install"]
```

I can run this with `mise run test:all` and it works. However, there is a
glaring issue that immediately juts out. All of the test runner output is
uncolored text. I'm used to and strongly prefer greens (passes), reds (fails),
and yellows (skips) of test runner output.

The test runners lose the text coloring when run through `mise` because they
believe they are not running in _interactive_ mode.

The [`expect`](https://linux.die.net/man/1/expect) tools (`brew install
expect`) install with another binary called
[`unbuffer`](https://linux.die.net/man/1/unbuffer). `unbuffer` can coerce a
command to run in interactive mode. Prepending these test runner commands with
`unbuffer` will preserve the colors as the results are output to the terminal.

Here is the update `test:all` task:

```toml
[tasks."test:all"]
run = """
unbuffer bundle exec rspec
unbuffer yarn test run
"""
description = "Run all tests (RSpec and Vitest)"
depends = ["bundle-install", "node-install"]
```

For some commands, it seems able to stream out (rather than _buffer_) the
results (e.g. with `vitest`). Whereas with `rspec`, the test suite runs to
completion and is then output to the terminal. I'm still investigating
streaming the `rspec` results.
