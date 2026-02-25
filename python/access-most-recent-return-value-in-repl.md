# Access Most Recent Return Value In REPL

One of my favorite features of Ruby's `irb` and `pry` are that you can use `_`
to reference the most recent return value. Often as we use an interpreter or
REPL, we end up with _intermediate_ values. That is, we've execute some kind of
statement which returned a value and we now want to use that resulting value in
our next statement. Python also supports `_`.

Let's say I've run a statement that took a while to process, but I forgot to
assign it to a variable. Instead of re-running the whole thing, I can create a
variable that references the previous return value using `_`.

```python
>>> BytePairEncoding.train_bpe(long_text)
{'merge_rules': [...], 'vocab': {...}}
>>> result = _
>>> list(result.keys())
['merge_rules', 'vocab']
```

Even if I don't necessarily want to assign it a variable, it can be nice to
reference the previous value as I continue with what I'm doing:

```python
>>> result['merge_rules'][0][1]
256
>>> result['vocab'][_]
b'e '
```

Notice how the value from the first statement gets used as part of a `dict`
access.

[source](https://docs.python.org/3/tutorial/introduction.html#numbers)
