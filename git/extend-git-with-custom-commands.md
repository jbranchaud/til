# Extend Git With Custom Commands

I recently learned about the [`git
absorb`](https://github.com/tummychow/git-absorb) command. It is interesting in
its own right, but I bring it up because it isn't a command that is built in to
git. When I was looking at the installation instructions for it, it didn't say
anything about how to _register_ the command with `git`.

How is git supposed to know about it? How do you extend git with custom
commands?

What I learned exploring those questions is that `git` will execute any command
on your _path_ with a `git-<command>` naming convention.

So, if I create a executable binary called `git-taco`, add it to my path, and
then run `git taco` (notice, no dash when I run it), `git` will run my custom
binary.

In the same way, if you download `git-absorb` and add it to your path, `git`
will run it for you when you enter `git absorb ...`.

You can even type something like `where git-` and then hit tab to prompt your
shell to display a list of a varity of other `git` commands, most of which
probably ship with `git`.

[source](https://twitter.com/jbrancha/status/1756361704160530555)
