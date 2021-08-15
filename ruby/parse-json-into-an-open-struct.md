# Parse JSON Into An OpenStruct

The `json` module that ships with Ruby is something I use a lot in web app
APIs. When a request comes in as a string of JSON, I use `JSON.parse` to turn
it into a hash. That's because a hash is much easier to work with than a string
representation of some JSON data.

```ruby
> require 'json'
=> true
> data = JSON.parse('{"name": "Josh", "city": "Chicago"}')
=> {"name"=>"Josh", "city"=>"Chicago"}
> data["name"]
=> "Josh"
```

The hash access syntax can sometimes get to be clunky. `JSON.parse` is flexible
enough that it can do more than turn a JSON string into a hash. It can turn it
into any object that plays along. `OpenStruct` is a great example of this.

To tell `JSON.parse` to use a class other than `Hash`, include [the
`object_class`
option](https://ruby-doc.org/stdlib-3.0.1/libdoc/json/rdoc/JSON.html#module-JSON-label-Parsing+Options).

```ruby
> json_str = '{"name": "Josh", "city": "Chicago"}'
=> "{\"name\": \"Josh\", \"city\": \"Chicago\"}"
> data = JSON.parse(json_str, object_class: OpenStruct)
=> #<OpenStruct name="Josh", city="Chicago">
> data.name
=> "Josh"
```

Because of how `OpenStruct` objects work, we can use method notation to access
the fields parsed from the JSON string.

[source](https://stackoverflow.com/a/48396425/535590)
