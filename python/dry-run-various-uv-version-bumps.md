# Dry Run Various uv Version Bumps

Let's say I have a [`uv`](https://docs.astral.sh/uv/) project that is currently
at version `0.1.0`.

```bash
❯ uv version --short
0.1.0
```

I am preparing to do a version bump. I can automatically do it with `--bump <part>` with either `patch`, `minor`, or `major`. I can first preview that new
version with the `--dry-run` flag.

```bash
❯ uv version --bump patch --dry-run --short
0.1.1

❯ uv version --bump minor --dry-run --short
0.2.0

❯ uv version --bump major --dry-run --short
1.0.0
```

This is a nice addition to a release script that needs to determine the version
either to confirm with the user or to pass to another step.

See `uv version --help` for more details.
