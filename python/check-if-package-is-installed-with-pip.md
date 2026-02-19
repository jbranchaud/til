# Check If Package Is Installed With Pip

I recently installed PyTorch, but when I tried using it, I was getting an error
about `numpy` not being installed. I was kind of surprised by that because I
thought I would have already had that.

I wanted to check, so I asked with `pip show`:

```bash
❯ python3 -m pip show numpy
WARNING: Package(s) not found: numpy
```

I can even list everything that is installed with `pip` using `pip list` like
so:

```bash
❯ python3 -m pip list
Package            Version   Build
------------------ --------- -----
certifi            2026.1.4
cffi               2.0.0
charset-normalizer 3.4.4
click              8.3.1
commonmark         0.9.1
cryptography       46.0.3
docutils           0.22.4
filelock           3.24.2
fsspec             2026.2.0
idna               3.11
Jinja2             3.1.6
...
```

I then installed `numpy` (`python3 -m pip install numpy`) and how I can use `pip
show` again to confirm that.

```bash
❯ python3 -m pip show numpy
Name: numpy
Version: 2.4.2
Summary: Fundamental package for array computing in Python
Home-page: https://numpy.org
Author: Travis E. Oliphant et al.
Author-email:
License-Expression: BSD-3-Clause AND 0BSD AND MIT AND Zlib AND CC0-1.0
Location: /Users/lastword/.local/share/mise/installs/python/3.12.12/lib/python3.12/site-packages
Requires:
Required-by:
```
