# Configure Other Attributes Of Dataclass Field

I have a basic [`dataclass`](https://docs.python.org/3/library/dataclasses.html)
defined with a few fields that looks like this:

```python
from dataclasses import dataclass
from datetime import datetime

@dataclass
class Session:
    start_time: datetime
    project_name: str
    tags: list[str]
    end_time: datetime | None = None

    # ...

new_session = Session(start_time, "my-project", [])
```

This syntax lets me define the fields that make up arguments to the underlying
`__init__` function. This only gets me so far though. What if I want `tags` to
have a default value of `[]`? What if I want to force those optional fields
(`tags` and `end_time`) to be keyword-only arguments?

To take the field definitions of my `dataclass` a bit further, I need the
[`field` function](https://docs.python.org/3/library/dataclasses.html#dataclasses.field)
which lets me configure more aspects of each field.

```python
from dataclasses import dataclass, field
from datetime import datetime

@dataclass
class Session:
    start_time: datetime
    project_name: str
    tags: list[str] = field(default_factory=list, kw_only=True)
    end_time: datetime | None = field(default=None, kw_only=True)

    # ...

sesh1 = Session(start1, "my-project", tags=["pytorch", "numpy"])
sesh2 = Session(start2, "other-project", end_time=datetime.now())
```

If I were to say the default value of `tags` is simply a `[]`, then the
`dataclass` definition gets evaluated with a reference to that specific instance
of an empty list. Every new `Session` I create would share and mutate that same
list. For this reason, `dataclass` detects and warns you away from that.

Instead, I specify `list` as the `default_factory` for `tags`. Each new
`Session` where `tags` is not provided will be factory'd a new empty list.

For scalar values, like `None`, I can use the `default` parameter instead like
I've done for `end_time`.

As for marking certain fields as keyword-only, the `kw_only` parameter can be
overridden with `True`.

See [the docs for `field`](https://docs.python.org/3/library/dataclasses.html#dataclasses.field)
for all the other configurable options.
