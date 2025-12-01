# Make Structs Easier To Use With Keyword Initialization

Typically a [`Struct`](https://ruby-doc.org/3.4.1/Struct.html#method-c-new) in
Ruby is defined and initialized like so:

```ruby
> Subscriber = Struct.new(:email, :first_name, :status, :tags)
=> Subscriber
> s1 = Subscriber.new('bob.burgers@example.com', 'Bob', :active, [:food, :family])
=> #<struct Subscriber email="bob.burgers@example.com", first_name="Bob", status=:active, tags=[:food, :family]>
> s1.email
=> "bob.burgers@example.com"
```

That's a nice way to structure light-weight objects.

A potential challenge with multi-argument `Struct` definitions like this,
especially when they aren't colocated with initialization, is that it can be
hard to remember or distinguish the argument order when initializing an instance
of one.

Ruby 2.5 added the `keyword_init` option to help with this exact issue. When
that option is set to `true` for a `Struct` definition, then we get to
initialize it with keyword arguments rather than positional arguments.

```ruby
> Subscriber = Struct.new(:email, :first_name, :status, :tags, keyword_init: true)
=> Subscriber(keyword_init: true)
* s1 = Subscriber.new(
*   first_name: 'Bob',
*   email: 'bob.burgers@example.com',
*   tags: [:food, :family],
*   status: :active
> )
=> #<struct Subscriber email="bob.burgers@example.com", first_name="Bob", status=:active, tags=[:food, :family]>
> s1.email
=> "bob.burgers@example.com"
```

Notice I have to use keyword arguments now and that because of that I can
organize them in whatever order makes sense. Coming back to view this line of
code later, it is easy to see attribute each value corresponds to.

[source](https://www.bigbinary.com/blog/ruby-2-5-allows-creating-structs-with-keyword-arguments)
