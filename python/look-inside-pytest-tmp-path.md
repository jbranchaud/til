# Look Inside Pytest tmp_path

In [Isolate and Debug File Side-Effects with Pytest
`tmp_path`](https://www.visualmode.dev/isolate-and-debug-file-side-effects-with-pytest-tmp-path),
I wrote about how I use
[`tmp_path`](https://docs.pytest.org/en/stable/reference/reference.html#std-fixture-tmp_path)
in a Pytest fixture to test [my `py-vmt` CLI](https://github.com/jbranchaud/py-vmt). During testing of the CLI interface
via [`click`'s testing utilities](https://click.palletsprojects.com/en/stable/testing/), `vmt` creates,
modifies, and reads from files. Isolating that behavior with the `tmp_path`
fixture is useful because it prevents individual test cases from conflicting
with one another.

Here is what the fixture looks like at the top of my test file:

```python
# auto fixture for all test cases that monkeypatches the platform dirs to a tmp
# path so that test side-effects don't persist between runs
@pytest.fixture(autouse=True)
def use_tmp_platform_dirs(tmp_path, monkeypatch):
    data_dir = tmp_path / "data"
    config_dir = tmp_path / "config"
    data_dir.mkdir()
    config_dir.mkdir()
    monkeypatch.setattr(CliContext, "get_data_dir", staticmethod(lambda: data_dir))
    monkeypatch.setattr(CliContext, "get_config_dir", staticmethod(lambda: config_dir))
```

The root of the temp directory is located at `tempfile.gettempdir()` and the
directories from there are organized with this structure:

```
{temproot}/pytest-of-{user}/pytest-{num}/{testname}/
```

So, in the case of `vmt`, I can find the `config` and `data` dirs for a specific
test run here:

```bash
❯ ls /var/folders/zc/q6gnvbgx6kq77828jn38716r0000gn/T/pytest-of-lastword/pytest-2/test_start_status_stop_flow0
config data
```
