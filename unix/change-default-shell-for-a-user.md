# Change Default Shell For A User

You can change the default shell program for a particular unix user with the
`chsh` command. Just tell it what shell program you want to use (e.g. `bash`
or `zsh`) and which user the change is for:

```
$ [sudo] chsh -s /usr/bin/zsh username
```

This command needs to be invoked with root privileges.

This command updates the entry for that user in the `/etc/passwd` file.

[source](http://superuser.com/questions/46748/how-do-i-make-bash-my-default-shell-on-ubuntu)
