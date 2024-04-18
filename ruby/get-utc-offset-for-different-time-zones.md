# Get UTC Offset For Different Time Zones

The [IANA Time Zone Database](https://www.iana.org/time-zones) uses identifiers
like `America/Chicago`, `Asia/Hong_Kong`, `Africa/Nairobi`, etc. as specifiers
for notable locations with time zone information.

> Most timezones correspond to a notable location and the database records all
> known clock transitions for that location; some timezones correspond instead
> to a fixed UTC offset.
—[Theory and pragmatics of the tz code and data](https://data.iana.org/time-zones/theory.html)

These identifiers can be used to look up time zone details with the [`tzinfo`
gem](https://github.com/tzinfo/tzinfo).

Here is an example of passing one to the `#get` method and then getting the UTC
offset in seconds.

```ruby
> require 'tzinfo'

> mountain = TZInfo::Timezone.get('America/Denver')
=> #<TZInfo::DataTimezone: America/Denver>
> mountain.utc_offset
=> -21600
```

We can even get the base UTC offset that doesn't account for DST:

```ruby
> moutain.base_utc_offset
=> -25200
```

Notice, this is the same as the standard offset for a time zone like Phoenix
that doesn't observe DST.

```ruby
> phoenix = TZInfo::Timezone.get('America/Phoenix')
=> #<TZInfo::DataTimezone: America/Phoenix>
> phoenix.utc_offset
=> -25200
```
