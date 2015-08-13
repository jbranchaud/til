# Hash Slicing

Rails' ActiveSupport adds
[`#slice`](http://api.rubyonrails.org/classes/Hash.html#method-i-slice) and
[`#slice!`](http://api.rubyonrails.org/classes/Hash.html#method-i-slice-21)
to the `Hash` class. The interface of these two methods seems a little
inconsistent though.

```ruby
> {a: 1, b: 2, c: 3}.slice(:a)
=> {:a=>1}
```

The `#slice` method returns what is being sliced.

```ruby
> {a: 1, b: 2, c: 3}.slice!(:a)
=> {:b=>2, :c=>3}
```

The `#slice!` method, on the other hand, returns what is being excluded.
