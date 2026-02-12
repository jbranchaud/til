# Make A Long String Of Text Readable

I have a paragraph of text that interpolates a couple user-specific values
before being included in an API request. Because it is being passed to an API,
it is a single-line string value. However, in the editor it is hard to read like
that because it overflows way past the edge of the viewport.

```ruby
description = "This is the description we need to provide for #{user.name} as part of an API request dealing with compliance and registration for a service. If you need to contact them, their email is #{user.email}."
```

I'd rather make this easier on myself and others to read from the editor while
still being able to submit a single-line string to the API. That can be
accomplished with a heredoc and some combination or `gsub`, `strip`, and
`squish`.

If we are in a strictly Ruby-only context, we can use `gsub` and `strip` to
collapse line breaks and remove surrounding white space.

```ruby
description = <<~MSG.gsub(/\s+/, ' ').strip
  This is the description we need to provide for #{user.name} as part
  of an API request dealing with compliance and registration for a
  service. If you need to contact them, their email is #{user.email}.
MSG
#=> "This is the description we need to provide for #{user.name} as part of an API request dealing with compliance and registration for a service. If you need to contact them, their email is #{user.email}."
```

Or in a Rails context, I can instead just use `squish`:

```ruby
description = <<~MSG.squish
  This is the description we need to provide for #{user.name} as part
  of an API request dealing with compliance and registration for a
  service. If you need to contact them, their email is #{user.email}.
MSG
#=> "This is the description we need to provide for #{user.name} as part of an API request dealing with compliance and registration for a service. If you need to contact them, their email is #{user.email}."
```
