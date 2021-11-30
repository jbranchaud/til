# Convert A Unix Epoch Timestamp To A Time Object

Ruby's `Time` class has an [`#at`
method](https://ruby-doc.org/core-2.6.3/Time.html#method-c-at) that allows you
get the _time_ at a certain unix epoch timestamp. That timestamp is an integer
value representing the number of seconds since the unix epoch. While it is a
handy way to store that data, it is hard to tell what time it represents at a
glance.

```ruby
Time.at(1669652477)
=> 2022-11-28 10:21:17 -0600
```

Using `Time.at` we are able to turn that integer into a `Time` object that
represents the date and time in a human-readable way.

[source](https://prathamesh.tech/2020/03/02/converting-timestamps-to-ruby-objects/)
