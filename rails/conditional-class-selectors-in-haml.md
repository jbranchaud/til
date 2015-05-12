# Conditional Class Selectors in Haml

You can assign a class selector to a tag in HAML like so:

```ruby
%div.active
```

You can conditionally assign a class selector in a concise manner like so:

```ruby
%div{ class: ( "active" if @thing.active? ) }
```

You can do multiple conditional class selectors with array syntax:

```ruby
%div{ class: [ ("active" if @thing.active?), ("highlight" if @thing.important?) ] }
```

[source](http://stackoverflow.com/questions/3453560/append-class-if-condition-is-true-in-haml-with-rails)
