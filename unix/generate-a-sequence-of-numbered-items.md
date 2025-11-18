# Generate A Sequence Of Numbered Items

The `seq` command will output the specified sequence of numbers.

```bash
❯ seq 1 5
1
2
3
4
5
```

With the `-f` (`--format`) flag we can interpolate those numbers as part of a
string.

```bash
❯ seq -f "day_%02g" 1 5
day_01
day_02
day_03
day_04
day_05
```

The `%g` indicates that there is a format specifier for a numeric type which is
where `seq` will inject the current value in the sequence. The `02` indicates
that it should be `0` padded to `2` digits.

We can then pipe this to another unix command, such as `mkdir` in order to
quickly create a bunch of directories for, say, [Advent of Code](https://adventofcode.com/2024).

```bash
❯ mkdir aoc_2024
❯ cd aoc_2024
❯ seq -f "day_%02g" 1 25 | xargs mkdir
```

See `man seq` for more details.
