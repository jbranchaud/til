# Run Python Tools With `uvx`

The [`uvx`](https://docs.astral.sh/uv/guides/tools/) binary which gets installed
as part of `uv` is equivalent to using `uv tool run`. It installs the specified
tool into an isolated, throwaway environment and then runs it from that
environment. This is useful for running standalone Python tools that don't
necessarily need to know anything about or use a specific codebase.

A dummy example of this is the classic `cowsay` program.

```bash
❯ uvx cowsay -t "Python tooling is so powerful\!"
  ______________________________
| Python tooling is so powerful! |
  ==============================
                              \
                               \
                                 ^__^
                                 (oo)\_______
                                 (__)\       )\/\
                                     ||----w |
                                     ||     ||


```

As for some more practical examples, here I can use `rich-cli` to render and
view a markdown file like a `README.md` right in the terminal.

```bash
❯ uvx --from rich-cli rich README.md --markdown --pager
```

Or how about trying out the latest version of a tool like `ruff` that differs
from the version currently installed for the target project.

```bash
❯ uvx ruff@latest check .
```

As an example of another standalone tool, here is `yt-dlp` to grab a video from
YouTube.

```bash
❯ uvx yt-dlp "https://www.youtube.com/watch?v=U3-43VBqpPc"
Installed 1 package in 9ms
[youtube] Extracting URL: https://www.youtube.com/watch?v=U3-43VBqpPc
[youtube] U3-43VBqpPc: Downloading webpage
[youtube] U3-43VBqpPc: Downloading visionos player API JSON
[youtube] U3-43VBqpPc: Downloading m3u8 information
[info] U3-43VBqpPc: Downloading 1 format(s): 616+251
[hlsnative] Downloading m3u8 manifest
[hlsnative] Total fragments: 456
[download] Destination: FILLER vs VAN BOENING 🔥 EPIC QUARTER-FINAL ｜ Las Vegas Open 2026- Dramatic Match [U3-43VBqpPc].f616.mp4
[download]  33.2% of ~ 775.25MiB at    9.37MiB/s ETA 00:56 (frag 152/456)
```
