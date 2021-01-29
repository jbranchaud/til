# Get The Current Time

Working with time and time zones in server development can get complicated.
Time-sensitive code that worked locally can unexpected fail when deployed to a
server in a different time zone. Or users can end up seeing timestamps that
look a few hours off.

To avoid this kinds of mistakes in Rails development, we should avoid using
`Time.now` and instead use `Time.current`.

> Rails saves timestamps to the database in UTC time zone. We should always use
> Time.current for any database queries, so that Rails will translate and
> compare the correct times.

```ruby
> Time.zone
=> #<ActiveSupport::TimeZone:0x00007fccf6b0a548
 @name="UTC",
 @tzinfo=#<TZInfo::DataTimezone: Etc/UTC>,
 @utc_offset=nil>
> Time.now
=> 2021-01-28 19:22:42.312577 -0600
> Time.current
=> Fri, 29 Jan 2021 01:22:45.926181000 UTC +00:00
> Time.zone = 'Eastern Time (US & Canada)'
=> "Eastern Time (US & Canada)"
> Time.now
=> 2021-01-28 19:23:28.255106 -0600
> Time.current
=> Thu, 28 Jan 2021 20:23:32.150545000 EST -05:00
```

My server's default time zone is UTC. `Time.now` gives me my computer's system
time (Central Time). `Time.current` gives me the time in UTC. If I then change
the server's time zone to Eastern Time, `Time.now` still offers up my system
time whereas `Time.current` produces the current time in Easter Time.

[source](https://thoughtbot.com/blog/its-about-time-zones)
