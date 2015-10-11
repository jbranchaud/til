# Create A File Descriptor with Process Substitution

Process substitution can be used to create a file descriptor from the
evaluation of a shell command. The syntax for process substitution is
`<(LIST)` where `LIST` is one or more bash commands.

```
$ cat <(echo 'hello, world')
hello, world
```

This is particularly useful for commands that expect files, such as diff:

```
$ diff <(echo 'hello, world') <(echo 'hello, mars')
1c1
< hello, world
---
> hello, mars
```

Sources: [Brian Dunn](https://twitter.com/higgaion) and
[Bash Guide for Beginners](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_04.html#sect_03_04_07)
