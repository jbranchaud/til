# Use `__post_init__` For `dataclass` Validations

The [`dataclass`](https://docs.python.org/3/library/dataclasses.html) construct
is a handy stdlib way of modeling some data with many improvements over a `dict`
such as named attributes and type visibility.

```python
from dataclasses import dataclass
from typing import ClassVar

@dataclass
class BPEConfig:
    BASE_VOCAB_SIZE: ClassVar[int] = 256

    vocab_size: int
    special_tokens: list[str]
```

I want to enhance `BPEConfig` a little by validating the `vocab_size` which
cannot be less than the `BASE_VOCAB_SIZE`. The
[`__post_init__`](https://docs.python.org/3/library/dataclasses.html#dataclasses.__post_init__)
method is a good place for this kind of validation.

```python
from dataclasses import dataclass
from typing import ClassVar

@dataclass
class BPEConfig:
    BASE_VOCAB_SIZE: ClassVar[int] = 256

    vocab_size: int
    special_tokens: list[str]

    def __post_init__(self):
        if self.vocab_size < self.BASE_VOCAB_SIZE:
            msg = f"vocab_size ({self.vocab_size}) must be greater than or equal to BASE_VOCAB_SIZE ({self.BASE_VOCAB_SIZE})"
            raise ValueError(msg)
```

With this in place, my program will fail fast if I try to use an invalid
`vocab_size`:

```python
>>> BPEConfig(22, [])
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<string>", line 5, in __init__
  File "/Users/lastword/dev/misc/build-an-llm/chapter_02/bpe_tokenizer.py", line 24, in __post_init__
    raise ValueError(msg)
ValueError: vocab_size (22) must be greater than or equal to BASE_VOCAB_SIZE (256)
```

This example is pulled directly from [the `BPETokenizer` I'm building](https://github.com/jbranchaud/build-an-llm-from-scratch/blob/d3fd0acd65c3e7419b2d15a64c8d74266d0488f6/chapter_02/bpe_tokenizer.py#L14-L24).
