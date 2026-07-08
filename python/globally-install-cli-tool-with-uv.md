# Globally Install CLI Tool With UV

When I add a tool like [`ruff`](https://github.com/astral-sh/ruff) to my project
with [`uv`](https://docs.astral.sh/uv/):

```bash
❯ uv add --dev ruff
```

Then I can run that tool within that project using `uv`:

```bash
❯ uv run ruff format
```

However if I want to be able to run that tool via its binary directly,
especially outside the context of that project, then I need to instead install
it globally.

This can be done with `uv` using the `tool install` subcommand:

```bash
❯ uv tool install ruff
Resolved 1 package in 192ms
Installed 1 package in 4ms
 + ruff==0.15.20
Installed 1 executable: ruff
```

Now I can run `ruff` directly from anywhere:

```bash
❯ ruff config line-length
The line length to use when enforcing long-lines violations (like `E501`)
and at which `isort` and the formatter prefers to wrap lines.

...
```

The `ruff` binary gets symlinked into my `.local/bin/` directory which is coming
from the `uv` tool directory.

```bash
❯ which ruff
/Users/lastword/.local/bin/ruff

❯ readlink -n /Users/lastword/.local/bin/ruff
/Users/lastword/.local/share/uv/tools/ruff/bin/ruff
```

See `uv tool install --help` for more details.
