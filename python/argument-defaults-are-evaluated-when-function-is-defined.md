# Argument Defaults Are Evaluated When Function Is Defined

When you define a function with any arguments that have default values, those
default values are evaluated and stored at the time that the function is defined
(i.e. when it is evaluated by the interpreter). This might feel counter
intuitive if you are coming from another language, like Ruby, where these kinds
of defaults are evaluated at call time. This is unremarkable for scalar values
like `4` or `"fallback"`. It's much more interesting when your defaults are
function calls.

What if our default is something like `datetime.now()`?

Here I've defined a `Timer` class that has a `start` and `stop` method. The
`stop` method can be called with a specific `datetime` value otherwise it falls
back to `datetime.now()` -- but when is _now_?

```python
from datetime import datetime, timezone
import time


class Timer:
    def __init__(self):
        self._start = None
        self._stop = None

    def start(self):
        self._start = datetime.now(timezone.utc)
        self._stop = None

    def stop(self, at=datetime.now(timezone.utc)):
        print(f"now: {datetime.now(timezone.utc)}")
        print(f" at: {at}")
        self._stop = at

        elapsed = self._stop - self._start
        return elapsed
```

Here I instantiate a timer, call `start`, sleep for 5 seconds, and then call
`stop`.

```python
timer = Timer()
timer.start()

time.sleep(5)

print(f"Elapsed: {timer.stop()}")
```

Here is what gets printed to `stdout`:

```
now: 2026-05-22 00:45:05.654878+00:00
 at: 2026-05-22 00:45:00.649699+00:00
Elapsed: -1 day, 23:59:59.999875
```

Notice that the actual _now_ (when the `stop` method is running) is about 5
seconds after the value of `at`. That is because `at`, which takes on the
default argument value, is `datetime.now()` as evaluated at the time the
function is interpreted. It is for that same reason that `self._stop` ends up
being just a hair earlier than the call to `start` which sets `self._start`.
Which explains why the _elapsed_ time is a negative value.

To avoid this awkwardness all together, set the default as `None` and then
override `None` at the start of the function:

```python
def stop(self, at = None):
    if at == None:
        at = datetime.now(timezone.utc)

    # ...
```
