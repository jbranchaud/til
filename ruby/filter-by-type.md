# Filter By Type

In Ruby, we have several ways to check if something is a certain type (class or
subclass). A couple common approaches you might see are `#is_a?` and `===`
(case equality operator):

```ruby
> 3.is_a?(Integer)
=> true
> Integer === 3
=> true
> 3 === Integer
=> false
```

Notice it is important to get the ordering of class and value right when using
`===`.

We can use these concepts to filter collections down to just those values of a
certain type. We can also ditch those methods and instead use
[`#grep`](https://ruby-doc.org/3.4.1/Enumerable.html#method-i-grep) to pattern
match on the type directly.

```ruby
> nums = [1, :two, 3.0, 'four', 5, -> { 6 }, 0.7]
=> [1, :two, 3.0, "four", 5, #<Proc:0x0000000123af0338 (irb):5 (lambda)>, 0.7]
> nums.filter { it.is_a?(Numeric) }
=> [1, 3.0, 5, 0.7]
> nums.filter { Integer === it }
=> [1, 5]
> nums.grep(Integer)
=> [1, 5]
> nums.grep(Numeric)
=> [1, 3.0, 5, 0.7]
```

[source](https://bsky.app/profile/lucianghinda.com/post/3mhi5xp3xhk25)
