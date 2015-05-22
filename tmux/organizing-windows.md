# Organizing Windows

If you use a number of tmux windows as part of your daily workflow, you may find that they get to be a bit of a mess from time to time. There are gaps in the numbering and they aren't laid out in the order you'd prefer. The `movew` command makes it easy to rearrange these windows.

If you have a window indexed at 2 and you want it to be the 4th window, then you can:

```
:movew -s 2 -t 4
```

If you have a gap such that the 4th and 5th windows are numbered 4 and 7, then you can focus the 7 window and simply invoke:

```
:movew
```

And that window will be reinserted at the next available slot, in this case, window 5.
