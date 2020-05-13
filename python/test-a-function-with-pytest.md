# Test A Function With Pytest

The [`pytest` framework](https://docs.pytest.org/en/latest/index.html) is a
solid choice for unit testing your python project.

Any file whose name is preceeded with `test_` that contains functions whose
names are preceeded with `test_` will be processed and executed by the pytest
test runner.

```python
# test_taco.py

def taco(day):
  return "Taco " + day

def test_taco_tuesday():
  assert taco("Tuesday") == "Taco Tuesday" # passes

def test_taco_blank():
  assert taco("") == "Taco" # fails, missing trailing space
```

Use `assert` statements to check that a comparison is `true`. If it isn't the
`assert` statement will result in a test failure with some output about what
went wrong.

Ensure you have `pytest` installed and then run the following from your project
directory:

```bash
$ pytest
#=> ... you'll see the test output below
```
