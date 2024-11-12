# Dunder Methods

Python has all kinds of special, or rather, _magic_ methods that allow for
customizing all kinds of class behavior. There is `__init__()`, `__bool__()`,
and so many others.

The thing they all have in common is that their names are wrapped in _double
underscores_. This is why they are called _dunder methods_.

Some of these are used every single day, like the `__init__()` method for
defining how a class should create an object. Others, used from time to time,
are for overriding how comparisons or conversions happen. E.g. you may want to
override `__bool__()` or `__len__()` to customize the truthiness of a custom
class.

There are so many others, ones you probably haven't even heard of. To see a
full listing, check out this [cheat sheet of every dunder
method](https://www.pythonmorsels.com/every-dunder-method/#cheat-sheet).

Note: these are not to be confused with _dunder attributes_ which are things
like `__name__`, `__file__`, and `__version__` which correspond to a value that
you can access in a specific context rather than behavior to override.
