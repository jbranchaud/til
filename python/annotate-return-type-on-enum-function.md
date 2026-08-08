# Annotate Return Type On Enum Function

I defined the following `StrEnum` class to capture the canonical set of valid
values for a _storage format_ in
[`py-vmt`](https://github.com/jbranchaud/py-vmt). It includes a `default`
function that can be called to get what the system considers the default storage
format.

```python
class StorageFormat(StrEnum):
    SQLITE = "sqlite"
    JSON = "json"

    @staticmethod
    def default():
        return StorageFormat.SQLITE
```

This works, but what is missing is a type annotation for the return value of
`default`.

I'd like to use `StorageFormat` as the return type annotation. However, the
annotations are eagerly evaluated at the time the function definition is being
processed. The `StorageFormat` class is not fully evaluated at that point and so
isn't available.

Instead, what I can do is quote `StorageFormat` as a string to make it a
_forward reference_.

```python
class StorageFormat(StrEnum):
    SQLITE = "sqlite"
    JSON = "json"

    @staticmethod
    def default() -> "StorageFormat":
        return StorageFormat.SQLITE
```

The string type annotation will be lazily evaluated at a later time when
`StorageFormat` fully exists. This is behavior that is slated to be deprecated.
And it is no longer needed as of [Python 3.14 which lazily evaluates all
annotations by default
now](https://docs.python.org/3/reference/compound_stmts.html#annotations).

If I want to be more specific with the above annotation, I can import [`Literal`
from `typing`](https://docs.python.org/3/library/typing.html#typing.Literal) and
then wrap a specific enum value.

```python
class StorageFormat(StrEnum):
    SQLITE = "sqlite"
    JSON = "json"

    @staticmethod
    def default() -> "Literal[StorageFormat.SQLITE]":
        return StorageFormat.SQLITE
```

Now it will specifically enforce `SQLITE` rather than accepting `SQLITE` or
`JSON`.
