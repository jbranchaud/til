# Control Passing Of Time In Tests

While it is nice to be able to write pure functional code, our software still
lives in the real world and may have to relate to or depend on the passing of
time. In order to test this kind of code, we need time to behave in a reliable,
deterministic way. One of the best ways to create a testing environment where
that is true is to bring in tooling that hijacks time.

The [`freezegun` module](https://github.com/spulec/freezegun) is a great tool
for that job. We can use it to freeze time at a specific testable point, advance
time a specific amount, and much more.

Here is an example from the tests for [my CLI-based time tracking
app](https://github.com/jbranchaud/py-vmt/blob/acb26e4840279d936a12f16c505ca7e75e9a6d20/tests/src/py_vmt/test_cli.py#L21)
where I freeze time before starting a session. That gives me a chance to assert
about the exact start time that is output by the command. Then I can advance
time a little and assert that the `status` command outputs the correct thing.

```python
import datetime
from freezegun import freeze_time

# some other test setup omitted ...

initial_datetime = datetime.datetime(
    2026, 3, 14, 15, 5, 11, 0, datetime.timezone.utc
)
with freeze_time(initial_datetime) as frozen_datetime:
    # start a session
    start_result = runner.invoke(cli, ["start", "my-project"])
    output = "Started tracking 'my-project' at 10:05AM"
    assert output in start_result.output

    frozen_datetime.tick(delta=datetime.timedelta(minutes=30))

    # check status
    status_result = runner.invoke(cli, ["status"])
    output = "Tracking 'my-project' for 30m (since 10:05AM)"
    assert output in status_result.output
```
