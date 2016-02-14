# Case Insensitive using Terminal

By default, Terminal is case sensitive for autocomplete and also when accessing
folders and files, so you have to configure it manually to ignore characters
case.

To do that you have to create a `~/.inputrc` file with the case insensitive
option, you can do that with the following command:

```bash
$ echo "set completion-ignore-case On" >> ~/.inputrc
```
Be sure to start a new terminal instance for the changes to take effect.

[source](http://blog.nickburwell.com/blog/2008/11/mac-os-x-terminal-case-insensitive-auto)
