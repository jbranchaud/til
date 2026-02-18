# Override Your Project Mise File

A project I'm working on has a version-controlled `.mise.toml` file in it. Some
changes were made to that recently that introduce some env vars that conflict
with my setup. If I make edits to that file, then I have a modified version of
`.mise.toml` sitting in my Git working copy.

```
# .mise.toml
[env]
CONFIG_SETTING = "project"
```

Instead, I can rely on the loading precedence rules of `mise` to override those
project settings with my individual settings. I can do that with the
`.mise.local.toml` file which is played on top of any `mise` configuration from
files further down the precedence chain.

```
# .mise.local.toml
[env]
CONFIG_SETTING = "override"
```

Assuming I have `mise` setup with my shell environment to automatically load in
these files, I can now check what takes precedence:

```bash
$ echo $CONFIG_SETTING
override
```

Make sure `.mise.local.toml` is included in the `.gitignore` file to avoid
checking in your personal environment overrides.

To be sure about what files are loaded and in what order, give `mise cfg` a try.
I discuss that in more detail in [List The Files Being Loaded By Mise](list-the-files-being-loaded-by-mise.md).
