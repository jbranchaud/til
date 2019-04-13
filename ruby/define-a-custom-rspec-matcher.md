# Define A Custom RSpec Matcher

You can define your own custom RSpec matchers. This is a great way to keep
your spec tight and readable. A custom, domain-specific matcher can convey
more intent in a single line than several lines of built-in matchers.

Here is a matcher to check if something is in a range:

```ruby
require 'rspec/expectations'

RSpec::Matchers.define :be_betwen do |lower, upper|
  match do |operand|
    expect(operand).to be >= lower
    expect(operand).to be <= upper
  end
end

describe MyThing do
  it "has a value between 0 and 10" do
    thing = MyThing.new

    expect(thing.value).to be_between(0, 10)
  end
end
```

By requiring `rspec/expectations` we are able to define a matcher that takes
0 or more arguments (in our case, `lower` and `upper`) and then make
assertions with them and the `expect` value.

[source](https://relishapp.com/rspec/rspec-expectations/v/2-4/docs/custom-matchers/define-matcher)
