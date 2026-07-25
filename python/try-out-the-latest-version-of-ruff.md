# Try Out The Latest Version Of Ruff

I have [a Python project](https://github.com/jbranchaud/py-vmt) using
[`ruff`](https://github.com/astral-sh/ruff) pinned to version `0.15.20`.

```toml
[dependency-groups]
dev = [
    "basedpyright>=1.39.9",
    "freezegun>=1.5.5",
    "pytest>=9.0.2",
    "ruff>=0.15.20",
    "types-dateparser>=1.3.0.20260211",
]
```

All source files are in alignment with the enabled `ruff` rules, so all checks
pass.

[Simon Willison just posted](https://simonwillison.net/2026/Jul/25/ruff/) about
a new version of `ruff` (`v0.16.0`) dropping that enables a TON of new rules. He
mentioned running it against some of his biggest projects and getting a bunch of
errors.

I was curious to see how my project would fare, so I ran the
[`uvx`](https://docs.astral.sh/uv/guides/tools/) command that Simon recommended
in his post.

```bash
❯ uvx ruff@latest check .
I001 [*] Import block is un-sorted or un-formatted
 --> defaults.py:1:1
  |
1 | / from datetime import datetime, timezone
2 | | import time
  | |___________^
  |
help: Organize imports
  |
1 + import time
2 | from datetime import datetime, timezone
  - import time
3 |
  |

UP017 [*] Use `datetime.UTC` alias
  --> defaults.py:11:36

...

Found 48 errors.
[*] 41 fixable with the `--fix` option.
```

Even this small project of mine has 48 errors. Luckily 41 of them can be
automatically fixed by `ruff`.

It is the `@latest` tag that tells
[`uvx`](https://docs.astral.sh/uv/guides/tools/) to find and run the latest
version of `ruff` which currently happens to be `0.16.0`. I can also reliably
point to a specific version like so:

```bash
❯ uvx ruff@0.15.14 check .
All checks passed!
```

Here is [a listing](https://github.com/astral-sh/ruff/tags) of all tagged `ruff`
versions.
