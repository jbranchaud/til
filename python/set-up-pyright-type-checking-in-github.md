# Set Up Pyright Type Checking In GitHub

As I get into more of a PR workflow with my development of
[`py-vmt`](https://github.com/jbranchaud/py-vmt), I need to set up some basic CI
checks in GitHub. For starters I want the same `pyright` type checking that I
have locally to be run in CI for consistency.

Though my editor is set up to do Pyright type checking as I work locally, I can
also manually run it with:

```bash
$ uv run pyright
```

Pyright will look for the `tool.pyright` section in my `pyproject.toml` file
which currently looks like the following:

```toml
[tool.pyright]
include = ["src", "tests"]
```

I can get this same type checking in CI for PRs by adding the following
`.github/workflows/typecheck.yml` file:

```yaml
name: pyright

on:
  pull_request:
  push:
    branches: [main]

jobs:
  typecheck:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install uv
        uses: astral-sh/setup-uv@v3
        with:
          enable-cache: true

      - name: Set up Python
        run: uv python install

      - name: Install dependencies
        run: uv sync --all-extras --dev

      - name: Run pyright
        run: uv run pyright
```

This adds a single `typecheck` job that installs `uv`, `python`, and my project
dependencies, and then runs `uv run pyright` (just like I do locally) to perform
type checking. If `pyright` discovers any type errors, the job will fail and I
can view the output of the job to see what needs fixing. Once I have dealt with
everything, the job will quietly pass with a green check mark.

Here is [the PR](https://github.com/jbranchaud/py-vmt/pull/2) where I added this
CI job.
