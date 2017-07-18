# Yarn Commands Without The Emojis

If you are a hater and you'd like to run [`yarn`](https://yarnpkg.com/en/)
commands without emojis being playfully included in the output, just include
the `--no-emoji` flag.  The output of a command like `add` will look like
this:

```bash
$ yarn add chalk --no-emoji
yarn add v0.17.10
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
[4/4] Building fresh packages...
success Saved lockfile.
success Saved 7 new dependencies.
├─ ansi-styles@3.1.0
├─ chalk@2.0.1
├─ color-convert@1.9.0
├─ color-name@1.1.3
├─ escape-string-regexp@1.0.5
├─ has-flag@2.0.0
└─ supports-color@4.2.0
Done in 0.54s.
```

See `yarn help` for details.
