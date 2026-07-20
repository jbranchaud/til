# Strictly Separate Positional And Keyword Arguments

Typically when I define a function with arguments in Python, I can choose pass
the arguments to that function as positional or keyword arguments. I can even
mix and match as long as all positional arguments come before all keyword
arguments.

But what if I want to enforce a strict boundary between what arguments are
positional and what arguments are keyword?

By combining the _positional-only marker_ (`/`) and _keyword-only marker_ (`*`),
I can get exactly that effect.

Here I have defined a `connect` function that takes `host` and `port` arguments.
Because both appear before the `/` marker, they must be passed as positional. I
also have a `timeout` argument with a default. Because `timeout` comes after the
`*` marker, it must be passed as a keyword argument.

```python
def connect(host, port, /, *, timeout=30):
    print(f"Connecting to #{host}:#{port}")
    print(f"  Timeout: {timeout}s")

    # ...
```

Let's see it in action.

```python
>>> connect("localhost", 3000, timeout=20)
Connecting to #localhost:#3000
  Timeout: 20s

>>> connect(host="localhost", port=4000)
Traceback (most recent call last):
  File "/Users/lastword/dev/misc/python-experiments/arguments.py", line 37, in <module>
    connect(host="localhost", port=4000)
TypeError: connect() got some positional-only arguments passed as keyword arguments: 'host, port'
```

This second attempt of calling `connect` with `host` and `port` as keyword
arguments presents as a runtime `TypeError` because they were expected as
"positional-only arguments".

In my editor that line also presents with two static typing errors `call-arg:
Unexpected keyword argument "port" for "connect"` (and the equivalent for
`host`).

Note: I did some additional reading just now in [Python in a Nutshell, 4th
Edition](https://www.oreilly.com/library/view/python-in-a/9781098113544/) and I
see that it is more appropriate to call them _Named Arguments_ instead of
_Keyword Arguments_.
