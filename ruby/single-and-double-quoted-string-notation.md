# Single And Double Quoted String Notation

If you are building a string that involves interpolation and literal double
quotes, then you'll have to do some escaping. Here is an example:

```ruby
> feet, inches = [6, 4]
> puts "I am #{feet}'#{inches}\" tall"
I am 6'4" tall
```

Having to escape a single instance of a double quote isn't so bad. If you find
yourself having to do it a bunch, Ruby has something for you. It is a string
syntax feature called [Percent Notation](percent-notation.md).

You can use percent notation to define double-quoted strings using `Q`:

```ruby
> puts %Q[I am #{feet}'#{inches}" tall]
I am 6'4" tall
```

No need to escape the double quote here.

There is a single-quoted version as well using `q`:

```ruby
> puts %q[I am #{feet}'#{inches}\" tall]
I am #{feet}'#{inches}\" tall
```

This is notably less useful than `%Q`. For that reason, `%Q` makes sense as a
default and it makes up the percent notations unmodified behavior:

```ruby
> puts %[I am #{feet}'#{inches}" tall]
I am 6'4" tall
```
