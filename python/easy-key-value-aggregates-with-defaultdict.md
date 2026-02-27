# Easy Key-Value Aggregates With defaultdict

The `collections` module has the `defaultdict` object that can be used to
aggregate values tied to a key. What sets this apart from simply using a `dict`
is that we get the base value for free. So if our aggregate value is a list,
then we get `[]` by default for each new key. In the same way, we'd get `0` if
it was constructed with `int`.

Here is the counter example from [Keep A Tally With
collections.Counter](keep-a-tally-with-collections-counter.md)

```python
from collections import defaultdict

def get_pair_counts(token_ids: list[int]) -> Counter:
    """Count how often each adjacent pair appears"""
    counts = defaultdict(int)
    for i in range(len(token_ids) - 1):
        pair = (token_ids[i], token_ids[i + 1])
        counts[pair] += 1
    return counts
```

We never have to initially set a key to `0`. If the key is not yet present, then
`int()` (the zero-value constructor) is used as the `__missing__` value.

We can do the same with `list`:

```python
>>> import collections
>>> stuff = collections.defaultdict(list)
>>> stuff['alpha'].append(1)
>>> stuff['alpha']
[1]
>>> stuff['beta']
[]
```

In the same way, this uses `list()` as the `__missing__` value to start of each
key with an `[]`.

I find this so handy because in other languages I've typically had to do
something more like this:

```python
words_by_length = {}
for item in items:
    if len(item) not in words_by_length:
        words_by_length[len(item)] = []
    words_by_length[len(item)].append(item)
```

This is much clunkier.
