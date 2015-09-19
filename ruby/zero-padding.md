# Zero Padding

Ruby makes zero-padding strings to a fixed length easy with `String#rjust`.

```ruby
> "1234".rjust(6, "0")
=> "001234"
> "123456".rjust(6, "0")
=> "123456"
```

In the same way, you can pad zeros on the other side of the string with
`String#ljust`.

```ruby
> "12".ljust(4, "0")
=> "1200"
> "".ljust(4, "0")
=> "0000"
```

h/t Dillon Hafer
