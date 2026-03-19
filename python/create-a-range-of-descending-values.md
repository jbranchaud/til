# Create A Range Of Descending Values

A typical use of `range` looks something like this:

```python
>>> list(range(1, 5))
[1, 2, 3, 4]
```

Which is equivalent to this one where we give a `step` value of `1`.

```python
>>> list(range(1, 5, 1))
[1, 2, 3, 4]
```

If we try to create a _negative range_, that is, a range of values in decreasing
order, we get an empty list.

```python
>>> list(range(0, -7))
[]
```

That's because the `step` value still defaults to `1`. And there are no positive
steps between `0` and `-7`. So, let's give `range` a `step` value of `-1`.

```python
>>> list(range(0,-7, -1))
[0, -1, -2, -3, -4, -5, -6]
```

One practical use case of a negative range like this is using a list
comprehension to transform it into a list of the _last seven days_.

```python
>>> from datetime import datetime, timedelta
>>> [datetime.now().date() + timedelta(days=days) for days in range(0,-7, -1)]
[datetime.date(2026, 3, 19), datetime.date(2026, 3, 18), datetime.date(2026, 3, 17), datetime.date(2026, 3, 16), datetime.date(2026, 3, 15), datetime.date(2026, 3, 14), datetime.date(2026, 3, 13)]
```

Of course this could have been written with a positive range and then
subtracting the `timedelta`. I like that I have the option of doing this in
whatever way makes the code most readable.
