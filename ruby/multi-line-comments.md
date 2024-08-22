# Multi-Line Comments

Ruby has an obscure syntax for creating multi-line comments.

In many languages, there is a multi-line comment syntax that looks something
like this:

```javascript
/*
 * multi-line comment in javascript
 */
```

This gets used often in those languages.

In Ruby, the multi-line comment syntax is not something we see very often. It
is a departure from the single-line comment syntax and it also requires no
indentation.

```ruby
RSpec.configure do |config|
  config.order = :random

# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # ...

=end
end
```

Using the `=begin` and `=end` syntax (no indentation), we make everything
inbetween into a comment.

Though we don't see this too often, I did pull this example directly from the
`spec_helper.rb` file that RSpec generates.

[source](https://docs.ruby-lang.org/en/master/syntax/comments_rdoc.html)
