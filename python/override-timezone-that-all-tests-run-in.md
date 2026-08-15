# Override Timezone That All Tests Run In

I was building out the initial functionality of a Python project in my local dev
env. I was writing tests along the way to guard against regressions. Many of the
tests assert things about time, durations, and formatted timestamps. All was
well.

Then I was getting the project setup on GitHub with a CI workflow to run the
test suite. And a ton of tests were failing. It was all the tests dealing with
time. They were all off by 5 hours.

I recognized that time difference immediately. That's the difference between my
time here in Chicago and UTC. When I run the tests locally, they are all
formatted the timezone setting on my machine -- `America/Chicago`. Whereas when
I run them in this CI environment, they were suddenly being formatted to `UTC`.

What I needed to do was explicitly set the timezone that all the tests would
always run in, regardless of environment.

I added the following to my `conftest.py` file:

```python
import os
import time


# Set the timezone that all tests run in
os.environ["TZ"] = "America/Chicago"
time.tzset()
```

First, I set the timezone (`TZ`) in `os.environ` to `America/Chicago`. That's a
copy of the executing environment that Python makes when it starts up.

Second, because `TZ` may be tied to some cached info under the hood, I have to
also run `time.tzset()`.

> Initialize, or reinitialize, the local timezone to the value stored in
> os.environ[‘TZ’]. The TZ environment variable should be specified in standard
> Unix timezone format as documented in the tzset man page (eg. ‘US/Eastern’,
> ‘Europe/Amsterdam’).

Now, all of my tests run reliably in `America/Chicago`.

To demonstrate all of this from the Python repl, here is an example:

```python
>>> from datetime import datetime
>>> import os
>>> import time
>>> os.environ["TZ"] = "America/Los_Angeles"
>>> time.tzset()
>>> datetime.now()
datetime.datetime(2026, 8, 15, 14, 3, 19, 373682)
>>> os.environ["TZ"] = "America/Chicago"
>>> time.tzset()
>>> datetime.now()
datetime.datetime(2026, 8, 15, 16, 3, 33, 322803)
```

Notice the two hour difference between those two.
