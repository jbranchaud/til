# Look Up Time Zone Info For Identifier

The `ActiveSupport::TimeZone` class overrides the `#[]` method to be a lookup
mechanism for IANA Time Zone Identifier strings. These are strings like
`America/Chicago` (or anything else listed under `TZInfo::Timezone.all`).

Let's get an instance for `America/Chicago`.

```ruby
> chi = ActiveSupport::TimeZone['America/Chicago']
=> #<ActiveSupport::TimeZone:0x00000001099d8140
 @name="America/Chicago",
 @tzinfo=#<TZInfo::DataTimezone: America/Chicago>,
 @utc_offset=nil>
```

Notice it has a `tzinfo` instance variable that we can access. That object
contains all kinds of useful things.

```ruby
> chi.tzinfo.name
=> "America/Chicago"
> chi.tzinfo.friendly_identifier
=> "America - Chicago"
> chi.tzinfo.abbr
=> "CDT"
> chi.tzinfo.utc_offset
=> -18000
> chi.tzinfo.dst?
=> true
```

All of these and more. Run `ls chi.tzinfo` in a `pry` session to see what else.
