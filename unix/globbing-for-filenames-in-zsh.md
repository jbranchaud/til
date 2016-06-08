# Globbing For Filenames In Zsh

Zsh has extensive support for _globbing_ for filenames. _Globbing_ is a
short-hand, of sorts, for generating filenames that meet certain criteria.
The generated filenames can be used with any command you might otherwise
provide a filename to in a unix setting.

For example, consider a directory full of files including many that are
named with numbers. You'd like to list all files that have numeric names.

Doing `ls` by itself gives the following result:

```bash
$ ls
10        11        2         3         4         801       92        code.rb   hello.txt
```

With the use of a numeric pattern, Zsh's _globbing_ helps `ls` limit the set
of listed files to just those with numeric names:

```bash
$ ls *[0-9]
10  11  2   3   4   801 92
```

This only scrapes the surface of what can be done with globbing in Zsh.

[source](http://zsh.sourceforge.net/Intro/intro_2.html)

h/t Josh Davey
