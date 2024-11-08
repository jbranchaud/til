# Store And Access Immutable Data In A Tuple

You can store heterogeneous data (of varying types) as a _tuple_ which is a
light-weight immutable data structure.

You can be explicit about the tuple by wrapping the items in parentheses:

```python
>>> book = ('An Immense World', 'Ed Yong', 2022)
```

Though it is also possible to comma-separate the items and forego the
parentheses.

```python
>>> book2 = 'The Shining', 'Stephen King', 1977
>>> book2
('The Shining', 'Stephen King', 1977)
```

Once we have our tuple, we can access any item from it positionally. We can
also use _sequence unpacking_ to assign the values to a series of variables:

```python
>>> book[0]
'An Immense World'
>>> book[1]
'Ed Yong'
>>> book[2]
2022
>>> title, author, publication_year = book
>>> title
'An Immense World'
>>> author
'Ed Yong'
>>> publication_year
2022
```

And, as promised, it is immutable (unlike lists):

```python
>>> book[1] = 'Agatha Christie'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'tuple' object does not support item assignment
```

[source](https://docs.python.org/3/tutorial/datastructures.html#tuples-and-sequences)
