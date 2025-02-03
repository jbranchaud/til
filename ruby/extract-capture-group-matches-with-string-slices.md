# Extract Capture Group Matches With String Slices

Ruby's _string slice_ syntax allows us to use the square brackets to access
portions of a string. It's most common to pass positional integer index
arguments or a range. However, in true Ruby fashion, another way of thinking
about defining the slice of a string is based on a regex match.

We can pass a regex and an int (specifying which match we want) to extract some
portion of a string based on the regex match. That includes capture groups.

Here are a couple examples of extracting matching capture groups as well as
getting the entire regex match:

```ruby
> "me+abc123@email.com"[/.+\+(.+)@(.+)/, 1]
=> "abc123"

> "me+abc123@email.com"[/.+\+(.+)@(.+)/, 2]
=> "email.com"

> "me+abc123@email.com"[/.+\+(.+)@(.+)/, 0]
=> "me+abc123@email.com"

> "me+abc123@email.com"[/.+\+(.+)@(.+)/]
=> "me+abc123@email.com"
```

The `0`th match (which is the default) corresponds to the full match. Each
integer position after that corresponds to any capture groups. This maps
directly to the underlying `MatchData` object:

```ruby
> /.+\+(.+)@(.+)/.match("me+abc123@email.com")
=> #<MatchData "me+abc123@email.com" 1:"abc123" 2:"email.com">
```

[source](https://ruby-doc.org/3.3.6/String.html#class-String-label-String+Slices)
