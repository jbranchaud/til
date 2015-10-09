# Colorful Output With MiniTest

Ruby's
[`MiniTest`](http://ruby-doc.org/stdlib-2.0.0/libdoc/minitest/rdoc/MiniTest.html)
is a minimal testing framework that you can easily drop-in to any Ruby
project. For those used to using [`RSpec`](http://rspec.info/) with it's fancy
red/green output, MiniTest can be a little disappointing. It prints boring,
uncolored text to the screen that lacks visual feedback. Fortunately, red
and green coloring can be added with
[`minitest/reporters`](https://github.com/kern/minitest-reporters).

Update your `Gemfile`:

```ruby
gem 'minitest-reporters'
```

Then require and configure `minitest-reporters` in your testing setup file
(e.g. `test/test_helper.rb`):

```ruby
require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]
```

You can now enjoy that Red, Green, Refactor cycle.
