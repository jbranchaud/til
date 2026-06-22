# Make Secure Temp File For Atomic Write

Two types of failure modes that can occur while writing to a shared file on the
file system are 1) a corrupted file due to a crash mid-write and 2) another
process reading a partial file mid-write.

One way I've handled this in [`py-vmt`](https://github.com/jbranchaud/py-vmt) is
to perform the write operations on a secure temp file and then use the OS-level
atomic `rename` operation. I do this by [creating a
`contextmanager`](https://docs.python.org/3/library/contextlib.html#contextlib.contextmanager)
that uses
[`tempfile.mkstemp`](https://docs.python.org/3/library/tempfile.html#tempfile.mkstemp)
and [`os.replace`](https://docs.python.org/3/library/os.html#os.replace).

Here is what the `contextmanager` looks like:

```python
from contextlib import contextmanager
from pathlib import Path
import os, tempfile

@contextmanager
def atomic_write(path: Path):
    # write to a tmp file in the same directory, then atomically swap it
    fd, temp_file_path = tempfile.mkstemp(dir=path.parent, suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as file:
            yield file
        os.replace(temp_file_path, path)
    except BaseException:
        os.unlink(temp_file_path)
        raise
```

This explicitly creates a secure temp file in the same directory as the given
path with `.tmp` as the suffix. I then open the file descriptor using the
`os.fdopen` context manager (which will manage closing the file descriptor for
me). The `@contextmanager` decorator plus the `yield file` are what allow this
to be used as a `with` block. Once any file operations are done, then I use
`os.replace` to atomically swap out the original file with the temp file.

Here is how I use it to write updates to JSON data files:

```python
def write_active_session(self, session: Session) -> None:
    with atomic_write(self.active_session_file) as file:
        json.dump(session.marshal(), file)
```
