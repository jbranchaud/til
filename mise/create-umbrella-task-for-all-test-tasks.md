# Create Umbrella Task For All Test Tasks

When I was first sketching out the [`mise`
tasks](https://mise.jdx.dev/tasks/running-tasks.html) for a Rails app, I added
the following two tasks. One is for running all the `rspec` tests. The Other is
for running all the `vitest` (JavaScript) tests.

```toml
[tasks."test:rspec"]
run = "unbuffer bundle exec rspec"
description = "Run RSpec tests"
depends = ["bundle-install"]

[tasks."test:vitest"]
run = "unbuffer yarn test run"
description = "Run Vitest tests"
depends = ["node-install"]
```

I didn't want to have to invoked both of this individually every time I wanted
to run the full suite. So I added a `test:all` task to do it all.

```toml
[tasks."test:all"]
description = "Run all tests (RSpec and Vitest)"
run = [
  "unbuffer bundle exec rspec",
  "unbuffer yarn test run",
]
description = "Run RSpec tests"
depends = ["bundle-install", "node-install"]
```

This worked (for now). But it ate at me, for a couple reasons. I had to
duplicate everything about the existing `test:rspec` and `test:vitest` tasks.
And this didn't account for a new kind of test task being added (e.g.
`test:e2e`).

Instead, I can rely on `depends` and wildcards to achieve this without the
duplication which makes it more future-proof.

```toml
[tasks."test:all"]
description = "Run all tests (RSpec and Vitest)"
depends = ["test:*"]
```

Running `mise run test:all` won't execute its own command, but because it
depends on all other `test:*` tasks, the tests will get run through those
dependencies.

This task naming pattern also allows for calling all tests with `mise run
"test:**"`.
