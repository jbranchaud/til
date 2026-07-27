# Start Jupyter Notebook With Extra Packages

I can start up a one-off [Jupyter notebook](https://jupyter.org/) with
[`uv`](https://docs.astral.sh/uv/) with the following command:

```bash
❯ uv run --with jupyter jupyter lab 
```

The `--with` flag is a `uv run` feature for [requesting additional
dependencies](https://docs.astral.sh/uv/concepts/projects/run/#requesting-additional-dependencies).
In this case, it includes the `jupyter` package as a dependency which is
necessary for the command to then run `jupyter lab`.

As I started following along with [Andrej Karpathy's "Neural Networks: Zero to
Hero" series](https://karpathy.ai/zero-to-hero.html), I quickly ran into an
issue with missing other dependencies. In the opening video, Andrej is importing
`numpy` and `matplotlib`. To ensure those packages are also available for import
in this notebook, I need to `--with` them as well.

```bash
❯ uv run --with jupyter --with numpy --with matplotlib jupyter lab 
```

Now, when I execute the following step, I don't have any import issues:

```python
import math
import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline
```
