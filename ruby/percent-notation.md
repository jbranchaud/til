# Percent Notation

Ruby has many uses for the `%` character. One of the more obscure uses is as
a notion for custom delimited strings. Use the percent notation with a
non-alphanumeric character to surround a string.

```ruby
> %=Jurassic Park=
=> "Jurassic Park"
> % Ghostbusters 
=> "Ghostbusters"
```

It even works with balanced characters

```ruby
> %(The Goonies)
=> "The Goonies"
```

This is useful for defining a string that has both types of quotes

```ruby
> %[That'll be the "day"]
=> "That'll be the \"day\""
```

It's also useful for creating horribly obfuscated code

```ruby
> %=what===%?what?
=> true
```

h/t [Josh Davey](https://twitter.com/joshuadavey/status/615613617099046912)
