# Override The Boolean Context Of A Class

Everything in Python has a truthiness that can be checked with `bool()`. An
empty list (`[]`) is falsy. A non-empty list (`[1,2,3]`) is truthy. Similar
with numbers:

```python
>>> bool(0)
False
>>> bool(1)
True
```

Any instance of an object is going to be truthy by default. If you want to
control in what context an instance is considered truthy or falsy, you can
override
[`__bool__()`](https://docs.python.org/3/reference/datamodel.html#object.__bool__).
If that's not implemented, but
[`__len__()`](https://docs.python.org/3/reference/datamodel.html#object.__len__)
is, then it will fallback to that.

Let's look at a few example classes:

```python
class CartZero:
    def __init__(self, items=[]):
        self.items = items or []

class CartBool:
    def __init__(self, items=[]):
        self.items = items or []

    def __bool__(self):
        print("__bool__() override")
        return bool(self.items)

class CartLen:
    def __init__(self, items=[]):
        self.items = items or []

    def __len__(self):
        print("__len__() override")
        return len(self.items)

class CartBoolAndLen:
    def __init__(self, items=[]):
        self.items = items or []

    def __len__(self):
        print("__len__() override")
        return len(self.items)

    def __bool__(self):
        print("__bool__() override")
        return bool(self.items)

cart1 = CartZero()
cart2 = CartBool()
cart3 = CartLen()
cart4 = CartBoolAndLen()

print("CartZero() -> %s" %(bool(cart1)))
print('')
print("CartBool() -> %s" %(bool(cart2)))
print('')
print("CartLen() -> %s" %(bool(cart3)))
print('')
print("CartBoolAndLen() -> %s" %(bool(cart4)))
```

An 'empty' `Cart` be default is truthy. However, we can override some
combination of `__bool__()` or `__len__()` to give it a boolean context that
goes `false` when "empty".

```
CartZero() -> True

__bool__() override
CartBool() -> False

__len__() override
CartLen() -> False

__bool__() override
CartBoolAndLen() -> False
```
