# Delete Every Other Line

You can delete every other line in the current buffer using the following
command.

There is a fairly elegant way in vim to delete every other line in the
current buffer. Why would you want to do that? I don't know. Nevertheless,
here it is:

```
:g/^/+d
```

This will essentially delete all even numbered lines. If you'd like to
delete all odd numbered lines, delete the first line in the file (`ggdd`)
and then run the same command as above.

This syntax is a bit awkward, so you may be better off going straight for a
macro (e.g. `qqjddq5@q` or `qqddjq5@q`).

[source](http://stackoverflow.com/questions/1946738/vim-how-to-delete-every-second-row)
