# Create A Sequence Of Values With A Step

The `seq` utility allows you to output a sequence of values.

You can start at `1` by default.

```bash
$ seq 3
1
2
3
```

Or you can specify the starting value.

```bash
$ seq 10 13
10
11
12
13
```

Adding a third argument in between those two will specify the step value that
should be taken to get from one to the other.

```bash
$ seq 6 3 15
6
9
12
15
```

That sequence starts at 6 and goes to 15 with a step value of 3.

See `man seq` for more details.
