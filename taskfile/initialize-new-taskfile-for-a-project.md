# Initialize New Taskfile For A Project

I'm adding [Taskfile](https://taskfile.dev/) to my [`py-vmt`
project](https://github.com/jbranchaud/py-vmt) to add clear, "documented with
code" ways of running the linter, formatter, type-checker, and tests. To get
started I need a `Taskfile.yml` file where I can define each of these tasks.
Instead of creating that file from scratch, the `task` utility has an `--init`
flag that will scaffold one for me.

```bash
❯ task --init
Taskfile created: Taskfile.yml

❯ cat Taskfile.yml
# https://taskfile.dev

version: '3'

vars:
  GREETING: Hello, World!

tasks:
  default:
    cmds:
      - echo "{{.GREETING}}"
    silent: true

❯ task
Hello, World!
```

This is a useful starting point because it declares both a variable and a
default task. From there I can start defining the actual tasks I need for my
project. For that I will either reference the docs on [Adding a build
task](https://taskfile.dev/docs/getting-started#adding-a-build-task) or copy
some lines from either my [TIL
taskfile](https://github.com/jbranchaud/til/blob/master/Taskfile.yml) or
[dotfiles
taskfile](https://github.com/jbranchaud/dotfiles/blob/main/Taskfile.dist.yml).
