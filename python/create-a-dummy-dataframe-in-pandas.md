# Create A Dummy DataFrame In Pandas

[Pandas](https://pandas.pydata.org/pandas-docs/stable/index.html) has all kinds
of utilities for pulling in and processing tabular data. You can pull in a
bunch of data from a SQL database into a `DataFrame`. This `DataFrame` object
is then something you could pass around, process, and read from.

When you are sketching out an implementation or writing some tests, it may not
be feasible to read data from a DB. Instead, you can create a little dummy
`DataFrame` using the
[`from_dict`](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.from_dict.html#pandas.DataFrame.from_dict)
function.


```python
import pd

data = {'pokemon': ['Charmander', 'Squirtle', 'Bulbasaur'], 'type': ['Fire', 'Water', 'Grass']}
pd.DataFrame.from_dict(data)
```

This creates a two column `DataFrame` with a `pokemon` header and a `type`
header. The two lists of value will be matched up positionally, so `squirtle`
will be paired with `water`.
