# Load A File Into The Python REPL

I opened up a Python REPL to try some things out.

```
$ python3
>>> import math
>>> math.floor(5/2)
2
```

Now, I want to reference a Python file I've been working on so that I can
manually test the behavior of what I'm building. To do this, I can import a file
by its name in the same way that I would import any module. Then I can use that
namespace for class and method references. Crucially, the file should exist in
the same directory the REPL was started from.

First, here is the file:

```python
# bpe.py
class BytePairEncoding:
    def text_to_bytes(text: str) -> list[int]:
        """Convert a string to a list of byte values (0-255)"""
        return list(text.encode("utf-8"))
```

Now to use it from the REPL:

```
$ python
>>> import bpe
>>> bpe.BytePairEncoding.text_to_bytes("Gimme some bytes!")
[71, 105, 109, 109, 101, 32, 115, 111, 109, 101, 32, 98, 121, 116, 101, 115, 33]
```
