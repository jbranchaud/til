# Detect If You Are On A Mac

There are a couple ways of detecting with vimscript if you are on a mac.
This can be useful if you are writing a plugin with OS-specific
functionality. Here are two ways to make that check.

```vimscript
if has('macunix') || has('mac') || has('osx')
  ...
endif
```

Alternatively, you can use Vim's `system()` function to execute unix's
`uname` command. This command will give you the name of the operating
system. In the event you are using a Mac, the result of `uname` should be
`Darwin`. The following regex match is a good way to make this check.

```vimscript
if system('uname') =~ "Darwin"
  ...
endif
```

See `:h has()`, `:h system()`, and `man uname` for more details.
