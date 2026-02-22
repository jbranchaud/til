# Keep A Tally With collections.Counter

Python's `collections` module comes with a
[`Counter`](https://docs.python.org/3/library/collections.html#collections.Counter)
object which is a specialized dict subclass focussed on tallying counts of keys.

> It is a collection where elements are stored as dictionary keys and their
> counts are stored as dictionary values. Counts are allowed to be any integer
> value including zero or negative counts.

I used it recently while doing an exploratory implementation of a Byte-Pair
Encoding (BPE):

```python
from collections import Counter

def get_pair_counts(token_ids: list[int]) -> Counter:
    """Count how often each adjacent pair appears"""
    counts = Counter()
    for i in range(len(token_ids) - 1):
        pair = (token_ids[i], token_ids[i + 1])
        counts[pair] += 1
    return counts
```

Here I'm able to count the number of occurrences of each pair of bytes from the
input text. A tuple of `int` values is hashable, so they work great as keys for
a `Counter`.

The count value of any key will default to `0`. That makes it straightforward to
increment from there as you iterating over occurrences.

```python
>>> counts = Counter()
>>> counts['hello']
0
>>> count['hello'] += 1
>>> count['hello']
1
```
