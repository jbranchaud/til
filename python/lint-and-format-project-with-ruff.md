# Lint And Format Project With Ruff

[Ruff](https://docs.astral.sh/ruff/) is "an extremely fast Python linter and
code formatter, written in Rust." I recently added it to my [`py-vmt` CLI project](https://github.com/jbranchaud/py-vmt) and here are some of the commands
I used right out of the box.

First, I use `uv` and so I installed it like so:

```bash
❯ uv add --dev ruff
```

First, I checked for linting errors. There were a bunch. The output looked like
this:

```bash
❯ uv run ruff check
F841 Local variable `frozen_datetime` is assigned to but never used
  --> tests/src/py_vmt/test_cli.py:88:43
   |
86 |         2026, 3, 14, 15, 5, 11, 0, datetime.timezone.utc
87 |     )
88 |     with freeze_time(initial_datetime) as frozen_datetime:
   |                                           ^^^^^^^^^^^^^^^
89 |         # cancel session without one started
90 |         cancel_result = runner.invoke(cli, ["cancel"])
   |
help: Remove assignment to unused variable `frozen_datetime`

...

Found 11 errors.
[*] 2 fixable with the `--fix` option (7 hidden fixes can be enabled with the `--unsafe-fixes` option).
```

Some of them could be automatically fixed, so I dealt with those first using the
`--fix` flag.

```bash
❯ uv run ruff check --fix
```

The remaining lint issues I had to deal with manually. Once I had addressed all
of them I got this message:

```bash
❯ uv run ruff check
All checks passed!
```

With the lint issues out of the way, the next stuff was to use `ruff` to apply
consistent auto-formatting across the entire project. Because I hadn't been
using any auto-formatter up to this point on this project, I can expect the diff
to be significant.

I can start with a dry run using the `--check` flag. This gives a summary of how
much formatting churn there is going to be.

```bash
❯ uv run ruff format --check
Would reformat: src/py_vmt/cli.py
Would reformat: src/py_vmt/session.py
Would reformat: src/py_vmt/time_helpers.py
Would reformat: tests/src/py_vmt/test_cli.py
Would reformat: tests/src/py_vmt/test_session.py
Would reformat: tests/src/py_vmt/test_time_helpers.py
6 files would be reformatted, 3 files already formatted
```

I'm using git and I have a clean working copy, so there is no real harm in just
going for it either.

```bash
❯ uv run ruff format
6 files reformatted, 3 files left unchanged
```

That makes all the formatting changes and I can use `git diff` to browse through
them before eventually committing them.

See `uv run ruff check --help` and `uv run ruff format --help` for more details.
