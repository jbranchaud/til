# Specify The Line Height Of The Quick Fix Window

You can use the following command to open the Quick Fix window:

```
:copen
```

By default the Quick Fix window will open with a height of 10 lines, meaning
it can fit 10 lines of text. You may want to specify the height of the quick
fix window when you open it, especially if you are working with limited
screen space. This can be done by prepending the command with a _height_.

```
:5copen
```

This will open the Quick Fix window with a height of 5 lines.

See `:h copen` for more details.
