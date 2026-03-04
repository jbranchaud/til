# Iterate Over A Dictionary

Let's say we have a `dict` that contains counts of occurrences for each word in
some sample text:

```python
words_frequency = {
    "the": 4,
    "a": 3,
    "dog": 1,
    "bone": 1,
    "wants": 1,
    ...
}
```

Here is how we can iterate over the `dict`, accessing both the keys and values:

```python
for word, count in word_frequency.items():
    print(f"- {word} appears {count} time{'' if count == 1 else 's'}")
```

Using the
[`items()`](https://docs.python.org/3/library/stdtypes.html#dict.items) method,
we're able to access both _key_ and _value_ with the for loop as it iterates.

Another approach is to loop directly on the `dict` which implicitly surfaces the
_key_ for iteration. This can then be used to get the value from the `dict`:

```python
for word in word_frequency:
    print(f"- {word}: {word_frequency[word]}
```
