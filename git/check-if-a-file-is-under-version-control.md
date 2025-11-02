# Check If A File Is Under Version Control

The `git ls-files` command can be used with the `--error-unmatch` flag to check
if a file is under version control. It does this by checking if any of the
listed files appears on the _index_. If any does not, it is treated as an error.

In a project, I have a `README.md` that is under version control. And I have
`node_modules` that shouldn't be under version control (which is why they are
listed in my `.gitignore` file). I can check the README and a file somewhere in
`node_modules`.

```bash
❯ git ls-files --error-unmatch README.md
README.md

❯ git ls-files --error-unmatch node_modules/@ai-sdk/anthropic/CHANGELOG.md
error: pathspec 'node_modules/@ai-sdk/anthropic/CHANGELOG.md' did not match any file(s) known to git
Did you forget to 'git add'?
```

Notice the second command results in an error because of the untracked
`CHANGELOG.md` file in `node_modules`.

Here is another example of this at work while specifying multiple files:

```bash
❯ git ls-files --error-unmatch README.md node_modules/@ai-sdk/anthropic/CHANGELOG.md package.json
README.md
package.json
error: pathspec 'node_modules/@ai-sdk/anthropic/CHANGELOG.md' did not match any file(s) known to git
Did you forget to 'git add'?
```

Each tracked file gets listed and then the untracked file results in an error.

See `man git-ls-files` for more details.
