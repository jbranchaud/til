# Useful ActiveSupport Constants For Durations

Whenever I'm passing a duration to a function, I like to [name it with the
unit](https://ruudvanasseldonk.com/2022/03/20/please-put-units-in-names)
relative to the value it represents. For instance, if I need to pass in an hour
duration in seconds, I might write the following line:

```ruby
hour_in_seconds = 60 * 60

# or

hour_in_seconds = 3600
```

ActiveSupport has a [Duration
class](https://api.rubyonrails.org/classes/ActiveSupport/Duration.html) with a
series of constants that we can reach for.

```ruby
> ActiveSupport::Duration::SECONDS_PER_MINUTE
=> 60
> ActiveSupport::Duration::SECONDS_PER_HOUR
=> 3600
> ActiveSupport::Duration::SECONDS_PER_DAY
=> 86400
> ActiveSupport::Duration::SECONDS_PER_WEEK
=> 604800
> ActiveSupport::Duration::SECONDS_PER_MONTH
=> 2629746
> ActiveSupport::Duration::SECONDS_PER_YEAR
=> 31556952
```

Though it is fun to know about these, we should keep in mind that this class
provides support for what is likely to be a more useful abstraction layer:

```ruby
> 1.hour
=> 1 hour
> 3.hours
=> 3 hours
> 1.day.to_i
=> 86400
```
