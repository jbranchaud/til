# Add A Bunch Of CLI Utilities With coreutils

The [`coreutils`](https://www.gnu.org/software/coreutils/) project is a
collection of useful utilities that every operating system ought to have.

> The GNU Core Utilities are the basic file, shell and text manipulation
> utilities of the GNU operating system. These are the core utilities which are
> expected to exist on every operating system.

While many of these utilities are redundant with BSD utilities that MacOS
chooses to ship with, there are some differences in the overlapping ons and then
many additions from `coreutils`.

They can be installed with Homebrew:

```bash
$ brew install coreutils
```

And then you should have some new things available on your path. Take `shuf`, for
instance. This utility can shuffle and select items from a file or incoming
lines from another command. Here I use it to randomly grab a number between 1
and 5 (with the help of `seq`):

```bash
❯ seq 1 5 | shuf -n 1
3

❯ seq 1 5 | shuf -n 1
2

❯ seq 1 5 | shuf -n 1
5
```

Or how about some utilities for manipulating file names? Among others there is
`realpath`, `basename`, and `dirname`.

```bash
❯ realpath README.md
/Users/lastword/dev/jbranchaud/til/README.md

❯ realpath README.md | xargs basename
README.md

❯ realpath README.md | xargs dirname
/Users/lastword/dev/jbranchaud/til
```

See the [manual](https://www.gnu.org/software/coreutils/manual/coreutils.html)
for many more details.
