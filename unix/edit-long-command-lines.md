# Edit long command lines in an editor

If you have a very long command line that you need to modify, you don't have 
to mess around in single-line mode.  You can open an editor and edit
the command line to your heart's content and then execute as if you had
typed it manually.

To do this, either start from nothing, or choose a commandline from the 
history buffer, and type:

```
CTRL-x-CTRL-e
```

Note, this will by default edit the command in the `emacs` editor.  If you
prefer vi, get into [VI MODE](unix/vim-keys-for-shell-history.md), and 
do this:

```
ESC-v<enter> 
```
