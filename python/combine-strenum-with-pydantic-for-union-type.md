# Combine StrEnum With Pydantic For Union Type

I want a [Pydantic](https://pydantic.dev/docs/validation/latest/get-started/)
model that I can use to verify the shape and values of user-provided config
file. Let's say, for now, the only config value supported by the file is
`storage_format` and it can be one of three values (`json`, `sqlite`,
`inmemory`).

I can start with a
[`StrEnum`](https://docs.python.org/3/library/enum.html#enum.StrEnum) class to
represent the set of valid values for the storage format field.

```python
from enum import StrEnum
from typing import Literal

class StorageFormat(StrEnum):
    SQLITE = "sqlite"
    JSON = "json"
    INMEMORY = "inmemory"

    @classmethod
    def default(cls) -> Literal[StorageFormat.SQLITE]:
        return cls.SQLITE
```

Notice I've also provided a class method called `default` for serving up a
fallback default value.

Here is the corresponding Pydantic `CliConfig` model which uses the
`StorageFormat` string enum class as the type signature for its `storage_format`
field.

```python
from pydantic import BaseModel

class CliConfig(BaseModel):
    storage_format: StorageFormat = StorageFormat.default()
```

For `storage_format` to be valid in the context of `CliConfig`, it must be one
of the values defined by that `StrEnum`. I get auto-complete, I get type
checking, and I can validate a config file I've just read into memory (in this
case, using
[`model_validate_json`](https://pydantic.dev/docs/validation/dev/api/pydantic/base_model/#pydantic.BaseModel.model_validate_json)).

```python
def _read_config(self) -> CliConfig:
    if self.exists():
        raw_json = self.config_file.read_text()
        return CliConfig.model_validate_json(raw_json)

    return CliConfig()
```
