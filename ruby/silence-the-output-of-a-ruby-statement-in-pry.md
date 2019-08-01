# Silence The Output Of A Ruby Statement In Pry

Sometimes running a command in a [`pry`](https://github.com/pry/pry) session
can produce a bunch of verbose output that you aren't interested in seeing.

Here is a contrived line of code whose output will take over the entire screen:

```ruby
(1..200).map { |i| i*i }
#=> [1,
4,
9,
16,
...
```

You can silence all of this output by tacking on a single character -- `;`.

```ruby
(1..200).map { |i| i*i };
```

[source](https://gist.github.com/lfender6445/9919357)
