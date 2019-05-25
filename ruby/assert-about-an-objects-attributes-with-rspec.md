# Assert About An Object's Attributes With RSpec

When testing an object that gets created as the result of some process, it can
be useful to assert about the attributes of that object. Not all of the
attributes are relevant and some can be hard to reliably test. Rather than
asserting about the result of calling `#attributes` or `#to_h` on an object, we
can focus in with the [`have_attributes`
matcher](https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/have-attributes-matcher)
provided by RSpec.

```ruby
RSpec.describe "have_attributes" do
  it "can assert on an ActiveRecord object" do
    book = Book.create(title: "Fledling", isbn: "123")

    expect(book).to have_attributes(title: "Fledgling", isbn: "123")
  end

  it "can assert on a Struct" do
    Name = Struct.new(:first, :last)
    some_name = Name.new("Liz", "Lemon")

    expect(some_name).to have_attributes(first: "Liz")
  end
end
```

In this example we were able to assert about all or just a subset of the
attributes on both an `ActiveRecord` object and a `Struct`.

See [the docs](https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/have-attributes-matcher) for more details.
