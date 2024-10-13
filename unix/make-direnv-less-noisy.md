# Make Direnv Less Noisy

I've been using [`direnv`](https://direnv.net/) to manage project and folder
specific environment variables for a bit now. I've found it to be pretty
seamless. It can feel like it is littering my shell with too much output when I
change directories though.

There are two levers to control its output.

First, the direnv logs (e.g. `direnv: loading ~/.../.envrc`) can be controlled
with the `DIRENV_LOG_FORMAT` env var. Add this to the
`~/.config/direnv/direnvrc` file (add that directory and file if necessary).
You can leave it blank to altogether hide log messages or you can gray-out the
log messages like this:

```
export DIRENV_LOG_FORMAT=$'\033[2mdirenv: %s\033[0m'
```

Second, you can hide the env var diff with a separate config. This diff is not
covered under the umbrella of logs controlled by the above setting. Set
[`hide_env_diff` in the `~/.config/direnv/direnv.toml`
file](https://direnv.net/man/direnv.toml.1.html#codehideenvdiffcode):

```toml
[global]
hide_env_diff = true
```

This second config was only added as of `v2.34.0`.

[source](https://esham.io/2023/10/direnv)
