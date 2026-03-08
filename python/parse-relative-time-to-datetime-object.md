# Parse Relative Time To datetime Object

I was looking for an out-of-the-box solution for parsing natural language,
relative time strings (e.g. `'33 minutes ago'`) into valid `datetime` objects.
The best library for this is
[`dateparser`](https://dateparser.readthedocs.io/en/latest/).

While it is as easy to use this as _import_ then _parse_:

```python
>>> import dateparser
>>> dateparser.parse('33 minutes ago')
datetime.datetime(2026, 3, 7, 23, 19, 9, 17855)
```

There is more to it if we need to deal with timezones.

In my use case, I wanted to my `datetime` object to be timezone-aware and I
wanted to store it in `UTC`.

As is, the above simple `datetime` object is not `tzaware`, meaning it doesn't
have any `tzinfo` attached to it.

```python
>>> dateparser.parse('33 minutes ago').tzinfo is not None
False
```

We need to pass some additional settings during `parse`.

```python
>>> settings = {'RETURN_AS_TIMEZONE_AWARE': True}
>>> dateparser.parse('33 minutes ago', settings=settings)
>>> _
datetime.datetime(2026, 3, 8, 9, 53, 36, 225099, tzinfo=zoneinfo.ZoneInfo(key='America/Chicago'))
>>> settings['TO_TIMEZONE'] = 'UTC'
>>> dateparser.parse('33 minutes ago', settings=settings)
>>> _
datetime.datetime(2026, 3, 8, 14, 54, 47, 34041, tzinfo=<StaticTzInfo 'UTC'>)
```

The first step to getting a `datetime` object that is `tzaware` is to set
`RETURN_AS_TIMEZONE_AWARE` to `True`. That picks up the locale setting of the
system it is running on -- in my case, I'm in Chicago.

I said I wanted to store this as UTC though. That means I need to pass an
additional setting `TO_TIMEZONE` with a value of `'UTC'` which will translate
the `datetime` from my local time to UTC -- notice the 5 hour difference from
`9` to `14`.

Storing `datetime` details like this with timezone info _as_ UTC is nice because
it keeps everything consistent at the storage layer and then at the presentation
layer I can always convert it right back to the local timezone with
`astimezone`.

```python
>>> _.astimezone()
datetime.datetime(2026, 3, 8, 9, 54, 47, 34041, tzinfo=datetime.timezone(datetime.timedelta(days=-1, seconds=68400), 'CDT'))
```

See the [`datetime` docs](https://docs.python.org/3/library/datetime.html) for
more details.
