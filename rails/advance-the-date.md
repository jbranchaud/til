# Advance The Date

In Rails land, you can advance a date forward and backward with the
`#advance` method:

```ruby
> Date.today
=> Wed, 31 Aug 2016
> Date.today.advance(days: 1)
=> Thu, 01 Sep 2016
> Date.today.advance(months: 1)
=> Fri, 30 Sep 2016
> Date.today.advance(months: -2)
=> Thu, 30 Jun 2016
```

h/t Dillon Hafer
