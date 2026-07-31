# Another Way To Mark Keyword-Only Dataclass Fields

In [Configure Other Attributes Of Dataclass
Field](configure-other-attributes-of-dataclass-field), I showed how the
[`dataclasses.field`](https://docs.python.org/3/library/dataclasses.html#dataclasses.field)
constructor function can be used. One of the parameters I demonstrated was
`kw_only`. Each field constructed with `kw_only=True` will be required to be
passed as a keyword-only parameter when constructing an instance of that
`dataclass`.

Another way to specify keyword-only parameters with `dataclass` fields is to
segment them with `KW_ONLY`. This sentinel value can be included as a
pseudo-field where all fields that come after it are treated as keyword-only.

Translating the example from that other post would look like this:

```python
from dataclasses import dataclass, field, KW_ONLY
from datetime import datetime

@dataclass
class Session:
    start_time: datetime
    project_name: str
    _: KW_ONLY
    tags: list[str] = field(default_factory=list, kw_only=True)
    end_time: datetime | None = None

    # ...

sesh1 = Session(start1, "my-project", tags=["pytorch", "numpy"])
sesh2 = Session(start2, "other-project", end_time=datetime.now())
```

The field whose value is `KW_ONLY` is only used to signal that keyword-only
boundary. It does not itself become a field of the dataclass.

On the one hand I like this approach because it feels closer to [the way this is
signaled in standard function definition
syntax](force-remaining-arguments-to-be-named.md).

```python
def build_session(start_time, project_name, *, tags, end_time=None)
```

On the other hand, it feels like magic `dataclass` syntax whereas the
`kw_only=True` parameter is more explicit.
