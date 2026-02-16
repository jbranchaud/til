# Iterate First N Items From Enumerable

As I'm working through the 2nd chapter of [Build a Large Language Model (from
scratch)](https://still.visualmode.dev/blogmarks/227), I came across a code
example processing a dictionary of words. This example used a for loop to print
out each dictionary entry until an index of 50 was reached on then it did a
`break`.

This struck me as an odd way to grab and process N items from a list. I did some
searching and found `itertools` which provides
[`islice`](https://docs.python.org/3/library/itertools.html#itertools.islice).

```python
from itertools import islice

# preprocess words from a file into a word list
all_words = ... # not shown here

vocab = {token: integer for integer, token in enumerate(all_words)}
for item in islice(enumerate(vocab.items()), 50):
    print(item)
```

The `islice` function is a better approach because the intention (to grab the
first 50 things) is encoded in the function call rather than buried in a loop
body. It also has equivalent memory efficiency to the original example because
it lazily processes the list of `vocab` items.
