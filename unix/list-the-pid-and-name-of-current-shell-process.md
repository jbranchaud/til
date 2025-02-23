# List PID And Name Of Current Shell Process

In Julia Evans' [How to add a directory to your
PATH](https://jvns.ca/blog/2025/02/13/how-to-add-a-directory-to-your-path/),
she shows off an odd-looking command for determining what shell (e.g. bash or
zsh) you are currently running.

```bash
$ ps -p $$ -o pid=,comm=

38105 -zsh
```

I already know I'm running `zsh`, but I thought this command was interesting
enough to dig into and break down.

- The `ps` command lists processes that "have controlling terminals"
- The `$$` is a special shell variable representing the PID of the current process (try `echo $$`)
- The `-p` flag allows you to specify a PID for `ps` to grab, in this case, the `$$` PID
- The `-o` flag allows us to specify the output format, such as the PID and command name
- The `=` after `pid` and `comm` tell `ps` to exclude headers from the output

Additionally, I noticed that it output `-zsh` (not just `zsh`). That leading
hyphen seems to indicate that [this `zsh` process is a _login
shell_](https://unix.stackexchange.com/a/46856/5916). That means it was the
process used to initiate an interactive shell session and something like the
`.zprofile` would have been sourced as part of that.
