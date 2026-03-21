# Deduplicate A List Into A Tuple

A `list` is not hashable which means you can't use it for things like `dict`
keys or cache keys. Instead you need to convert it into something like a `set`
or a `tuple`.

Here is an example list:

```python
>>> l1 = [3,4,1,2,5,4,1]
```

Turning this list into a `set` or `frozenset` is straightforward:

```python
>>> set(l1)
{1, 2, 3, 4, 5}
>>> frozenset(l1)
frozenset({1, 2, 3, 4, 5})
```

If you're trying to preserve the order after deduplicating, then you'll want to
use a `tuple` instead of a `set`. In order to deduplicate while maintaining the
ordering, you can exploit the fact that `dict` keys maintain their order. A
`list` can be transformed into the keys of a `dict` with
[`dict.fromkeys`](https://docs.python.org/3/library/stdtypes.html#dict.fromkeys):

```python
>>> dict.fromkeys(l1)
{3: None, 4: None, 1: None, 2: None, 5: None}
```

And here is your `tuple` which extracts the keys of the `dict`:

```python
>>> tuple(dict.fromkeys(l1))
(3, 4, 1, 2, 5)
```

By comparison, here is the `tuple` transformed directly from the `list` without
deduplication.

```python
>>> tuple(l1)
(3, 4, 1, 2, 5, 4, 1)
```
