# Open The Directory Of The Current File

In one of my first TILs ever, [Head Of File
Name](https://github.com/jbranchaud/til/blob/master/vim/head-of-file-name.md),
I wrote about a fancy, archaic way of popping open a netrw view for the
directory of the current file. To this day, I still use it all the time when
I'm curious about the other files co-located with the file I'm editing.

There are a couple other ways to do this that arguably require less finger
gymnastics.

```
:Explore
```

This has the same behavior `:e %:h` at the cost of a few extra (easier to
reach) keys.

There is also

```
:Sex
```

which opens it up in a split. And as you'd expect, you can also use `:Vex`
for a vertical split.

[source](http://superuser.com/questions/31677/how-do-i-open-the-directory-of-the-current-open-file)
