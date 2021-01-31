# Pattern Match Values From A Hash

As of Ruby 3.0.0, the _rightward assignment_ operator (`=>`) was introduced as
another syntax for assigning values to variables. With it comes an experimental
pattern matching capability. This pattern matching can be used with hashes to
extract keyed values into local variables.

Pattern matching with rightward assignment can be done by placing a hash on the
left-hand side of the `=>` operator and then placing a hash-like listing of
keys to be matched against.

```ruby
> some_hash = { name: "Josh", handle: "@jbrancha", age: :unknown }
=> {:name=>"Josh", :handle=>"@jbrancha", :age=>:unknown}
> some_hash => {name:, handle:}
(irb):3: warning: One-line pattern matching is experimental, and the behavior may change in future versions of Ruby!
=> nil
> name
=> "Josh"
> handle
=> "@jbrancha"
```

This example extracts `name` and `handle` as local variables assigned with the
values of the those keys from the hash.

Note that this feature is _experimental_.

Also note that referencing a key that doesn't exist in a pattern matching
statement will raise a `NoMatchingPatternError`.

[source](https://www.ruby-lang.org/en/news/2020/12/25/ruby-3-0-0-released/)
