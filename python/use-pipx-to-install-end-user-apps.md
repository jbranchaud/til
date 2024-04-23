# Use pipx To Install End User Apps

The [`pipx`](https://pipx.pypa.io/stable/) tool is an installer for the python
ecosystem. It differs from `pip` in that it is for installing end-user
applications and it does so in isolated environments.

You can install `pipx` with an OS-specific installer like Homebrew:

```bash
$ brew install pipx
```

Ensure `pipx`-installed apps are on your path:

```bash
$ pipx ensurepath
```

Then use `pipx` to install programs like
[`cowsay`](https://pypi.org/project/cowsay/) or
[`llm`](https://llm.datasette.io/en/stable/setup.html):

```bash
$ pipx install llm

$ which llm
/Users/jbranchaud/.local/bin/llm

$ llm --version
llm, version 0.13.1
```
