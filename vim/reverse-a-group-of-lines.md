# Reverse A Group Of Lines

The following command can be used to reverse the order of all lines in a
file by doing a global move on all lines that match the beginning of line
character starting at the theoretical 0th character:

```
:g/^/m 0
```

Reversing a range of lines is a little more work. Just as the previous
example needs to be anchored against the 0th character, a specific range of
lines needs to be anchored at the line just before the range. Thus reversing
the lines 5 to 10 requires being anchored at line 4, like so:

```
:4,10g/^/m 4
```

See `:h 12.4` for more details on how this works.

[source](http://superuser.com/questions/189947/how-reverse-selected-lines-order-in-vim#)
