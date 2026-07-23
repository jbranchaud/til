# Resurface Exceptions Swallowed By Click Under Test

The testing utilities provided by
[Click](https://click.palletsprojects.com/en/stable/) are generally very nice to
work with. One particular aspect of makes the testing feedback loop almost
non-existent. Click stashes any actual exceptions that occur during a run of the
`CliRunner` and instead shows an opaque failed assertion.

Here is the primary output of a failing test I'm dealing with for
[`py-vmt`](https://github.com/jbranchaud/py-vmt):

```bash
tests/src/py_vmt/test_cli.py:61: AssertionError
======================================== short test summary info ========================================
FAILED tests/src/py_vmt/test_cli.py::test_start_status_stop_flow[sqlite] - assert "Tracking 'my-project' for 30m (since 10:05AM)" in '• Not tracking\n'
=========================================== 1 failed in 0.07s ===========================================
```

What I'd rather see when this test fails is something a little closer to the
root cause of the failure, like this:

```bash
        result = cursor.execute(fetch_active_session_sql)
        if result.fetchone() is None:
            return None
>       _id, _active, project_name, start_time, end_time = result.fetchone()
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
E       TypeError: cannot unpack non-iterable NoneType object

src/py_vmt/cli.py:46: TypeError
======================================= short test summary info ========================================
FAILED tests/src/py_vmt/test_cli.py::test_start_status_stop_flow[sqlite] - TypeError: cannot unpack non-iterable NoneType object
========================================== 1 failed in 0.11s ===========================================
```

That's more like it. `TypeError: cannot unpack non-iterable NoneType object` and
a specific pointer to the line where this happened is way more helpful.

To get this improvement in my test failure output, I had to create a small
wrapper around `CliRunner` that re-raises the exception I care about. I add this
in my `conftest.py` in the same directory as my `test_cli.py` file.

```python
from click.testing import CliRunner

class BetterCliRunner(CliRunner):
    def invoke(self, *args, **kwargs):
        result = super().invoke(*args, **kwargs)
        if result.exception and not isinstance(result.exception, SystemExit):
            raise result.exception
        return result
```

Then in `test_cli.py` I import the `BetterCliRunner` class and replace all
instantiations of `CliRunner()` with `BetterCliRunner()`.
