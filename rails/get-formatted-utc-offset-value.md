# Get Formatted UTC Offset Value

The UTC offset (during DST) for Chicago is `-05:00`. And for Newfoundland it is
`-02:30`.

Rails has an [`ActiveSupport::TimeZone`
module](https://api.rubyonrails.org/v7.1.3.2/classes/ActiveSupport/TimeZone.html#method-c-seconds_to_utc_offset)
that can turn the UTC offset in seconds into this formatted value.

```ruby
> chicago = TZInfo::Timezone.get('America/Chicago')
=> #<TZInfo::DataTimezone: America/Chicago>
> ActiveSupport::TimeZone.seconds_to_utc_offset(chicago.utc_offset)
=> "-05:00"

> newfoundland = TZInfo::Timezone.get('America/St_Johns')
=> #<TZInfo::DataTimezone: America/St_Johns>
> ActiveSupport::TimeZone.seconds_to_utc_offset(newfoundland.utc_offset)
=> "-02:30"
```

The underlying `tzinfo` gem is DST-aware and its database even knows which time
zone identifiers don't observe DST, so you can run this anytime of the year and
expect reliable results.

Here is another way at this:

```ruby
> chicago = TZInfo::Timezone.get('America/Chicago')
=> #<TZInfo::DataTimezone: America/Chicago>
> ActiveSupport::TimeZone[chicago.name]
=> #<ActiveSupport::TimeZone:0x00000001099d8140 @name="America/Chicago", @tzinfo=#<TZInfo::DataTimezone: America/Chicago>, @utc_offset=nil>
> ActiveSupport::TimeZone[chicago.name].formatted_offset
=> "-06:00"
> ActiveSupport::TimeZone[chicago.name].formatted_offset(false)
=> "-0600"
```
