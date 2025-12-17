# Create A Module Of Utility Functions

In my [latest blog post](https://www.visualmode.dev/create-a-module-of-utility-functions-in-ruby),
I went into full detail about how the [`Module#module_function` method](https://ruby-doc.org/3.4.1/Module.html#method-i-module_function) works.
It creates both a module of utility functions that we can access directly on
that module like we would with `self` methods. It can also be included in a
class as a way of sharing copies of those utility functions with the class. A
key point to them being copies is that they can then be overridden by the
including class.

Here is the example I used in the blog post:

```ruby
module MarkdownHelpers
  module_function

  def heading(text, level = 1)
    ("#" * level) + " #{text}"
  end

  def link(text, href)
    "[#{text}](#{href})"
  end

  def image(alt_text, href)
    "!#{link(alt_text, href)}"
  end
end
```

I won't cover everything that the blog post covers, but what I found really nice
about this pattern is that I can call those utility functions directly with the
module as the receiver:

```bash
$ ruby -r ./markdown_helpers.rb -e 'puts MarkdownHelpers.link("Click here", "https://example.com")'
[Click here](https://example.com)
```

The alternative to this generally looks like:

```ruby
module MarkdownHelpers
  def self.heading(text, level = 1)
    ("#" * level) + " #{text}"
  end

  def self.link(text, href)
    "[#{text}](#{href})"
  end

  def self.image(alt_text, href)
    "!#{link(alt_text, href)}"
  end
end
```

That would be fine, but we completely lose out on the ability to include it as a
mix-in with other classes.
