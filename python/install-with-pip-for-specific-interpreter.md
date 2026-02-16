# Install With PIP For Specific Interpreter

The `pip` module can be invoked for any of its commands, such as install, using
a specific Python interpreter like so:

```bash
$ python3 -m pip install black
```

This avoid ambiguity between the version of Python I am using and version of the
package manager I'm using.

Similarly if I need to upgrade `pip`, I can do the following:

```bash
$ python3 -m pip install --upgrade pip
```
