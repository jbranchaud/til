# Override Output Field Separator

Have you ever seen `$,` as a specific piece of syntax before? I've never
actually seen any Ruby code that uses this in the wild. It's called the _output
field separator_. By default it is `nil`. Like other keywords prefixed with `$`
it is a global variable.

It can be used to control what gets used by default as a separator in variety of
contexts, like when calling `#join` without any argument.

```ruby
> [1,2,3].join
=> "123"
> $,
=> nil
> $, = '~'
=> "~"
> [1,2,3].join
=> "1~2~3"
```

It is also what gets used when calling `print` with multiple arguments:

```ruby
> $, = ' |v| '
=> " |v| "
> print "hello", "world"
hello |v| world=> nil
> $, = "\t"
=> "\t"
> print "hello", "world"
hello	world=> nil
```

This seems pretty esoteric so far, but might be useful in a one-liner where
we're doing something like parsing data from a CSV:

```ruby
# awk-style: pull fields 1 and 3 from a CSV, emit them tab-separated
ruby -F, -ane 'BEGIN { $, = "\t"; $\ = "\n" }; print $F[0], $F[2]' data.csv
```

My attention was originally drawn to `$,` by a [post from Chris
Oliver](https://lnkd.in/p/g6YH5KvQ) which showed this method definition from
Rails source:

```ruby
def safe_join(array, sep = $,)
```

Note that this is [now
deprecated](https://docs.ruby-lang.org/en/master/language/globals_md.html#deprecated).
