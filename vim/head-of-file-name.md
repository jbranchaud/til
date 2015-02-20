# Head of File Name

At Hashrocket, I kept seeing my coworkers type a variety of commands into
vim command mode that included `%:h`. I finally decided to ask what was
going on. It turns out that it produces the directory of the file in your
current vim buffer.

The `%` represents the current file and `:h` is a filename modifier,
*head of the filename*, that truncates the last component and any
separators. So if you remove the file part of the current file (`%`), you
are left with the (relative) directory of the current file. Your imagination
and vim's flexibility can now take over.

A common use case is to use it to quickly edit another file that you know is
in the same directory. Why type out a long pathname over and over throughout
the day, when you can type:

```
:e %:h<tab>
```

After hitting tab, the pathname will be auto-completed. Complete the rest of the
filename as you do.

Or perhaps you aren't sure what file you want to edit and you'd rather just
get a picture of the whole directory:

```
:e %:h
```

You are now exploring the whole directory in netrw mode. Yay!

If you want to find out more about similar features,
there is a section in the Vim documentation that talks all about [filename
modifiers](http://vimdoc.sourceforge.net/htmldoc/cmdline.html#filename-modifiers).
