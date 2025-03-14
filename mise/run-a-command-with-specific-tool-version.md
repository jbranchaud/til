# Run A Command With Specific Tool Version

Because I'm using `mise` to manage the versions of tools like Node, I can
execute commands in the context of specific versions. Behind the scenes `mise`
makes sure I have the necessary tool(s) installed at the desired version(s).

So, [`mise exec` command](https://mise.jdx.dev/cli/exec.html) will default to
using the latest version of a tool if I haven't been more specific. At the time
of this writing, for Node, that is v23.

```bash
$ mise exec node -- node --version
v23.9.0
```

To be specific I could specify the major version with `node@23` like so:

```bash
mise exec node@23 -- npx repomix
Need to install the following packages:
repomix@0.2.39
Ok to proceed? (y) y

...
```

Or if I wanted to use a different, older version of Node, I could specify that
as well. We can see it will first install that and then execute the command:

```bash
$ mise exec node@22 -- npx repomix
gpg: Signature made Tue Feb 11 04:44:53 2025 CST
gpg:                using RSA key C0D6248439F1D5604AAFFB4021D900FFDB233756
gpg: Good signature from "Antoine du Hamel <duhamelantoine1995@gmail.com>" [unknown]

📦 Repomix v0.2.39

...
```
