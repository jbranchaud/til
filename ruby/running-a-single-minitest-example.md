# Running A Single MiniTest Example

Consider the following
[MiniTest](http://ruby-doc.org/stdlib-2.0.0/libdoc/minitest/rdoc/MiniTest.html)
file:

```ruby
# test_stuff.rb
require 'minitest/autorun'

class TestStuff < MiniTest::Unit::TestCase
  def test_first_thing
    assert_equal 4, (2 * 2)
  end

  def test_second_thing
    assert_equal 9, (3 * 3)
  end
end
```

If we want to run all the tests in this file, we can do so with:

```bash
$ ruby test_stuff.rb
```

But what if we want to run a specific test? We can target a single MiniTest
example with the `--name` flag and the name of that example. We can do
something like the following:

```bash
$ ruby test_stuff.rb --name test_second_thing
```

[source](http://stackoverflow.com/a/5292885/535590)
