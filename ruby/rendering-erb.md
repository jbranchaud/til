# Rendering ERB

If you have a string that contains ERB templating, you can quickly generate
the resulting string with the following code snippet:

```ruby
require 'erb'

some_template_string = <<-TEXT
The top
<% 5.times do |i| %>
Item <%= i + 1 %>
<% end %>
The bottom
TEXT

puts ERB.new(some_template_string).result
```

This will print the following to stdout:

```
The top
Item 1
Item 2
Item 3
Item 4
Item 5
The bottom
```

[source](http://www.stuartellis.eu/articles/erb/)
