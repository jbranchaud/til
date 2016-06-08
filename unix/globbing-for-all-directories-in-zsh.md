# Globbing For All Directories In Zsh

Globbing in Zsh is an expressive way to generate filenames for commands.
This includes working with directories. If I'd like to run a command against
all directories in the current directory, I can employ the `*(/)` globbing
pattern.

```bash
$ echo *(/)
one three two
```

What about all directories in the root directory?

```bash
$ echo /*(/)
/Applications /Library /Network /System /Users /Volumes /bin /cores /dev /home /net /opt /private /sbin /usr
```

You can go ahead and use that with any other command now (e.g. `ls`).

[source](http://zsh.sourceforge.net/Intro/intro_2.html)
