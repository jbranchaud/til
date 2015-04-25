# Joining Lines Together

You can quickly join a series of lines onto a single line using the `J`
command. Simply hitting 'J' in normal mode will join the current line with
the line below it leaving a space in between the two. If you want to join
the next 5 lines, you can hit `5J`. Hitting '5J' on this:

```
first,
second,
third,
fourth,
fifth
```

will transform it into this:

```
first, second, third, fourth, fifth
```

Similarly, you can perform a line by line join on a visual selection by
hitting `J` after making the desired visual selection.
