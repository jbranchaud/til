# YAML Is A Superset Of JSON

Put another way, JSON is a subset of YAML.

Here is what the YAML spec has to say:

> YAML can therefore be viewed as a natural superset of JSON, offering improved
> human readability and a more complete information model. This is also the
> case in practice; every JSON file is also a valid YAML file.

We can _see_ this in practice by using our favorite YAML parse to read a JSON
file. For me that is Ruby and its built-in YAML library.

First, consider the following JSON file (`data.json`):

```json
{
  "data": [
    "one",
    "two",
    "three"
  ],
  "number": 22
}
```

Now, I'll open up an IRB session (Ruby's interactive REPL) and read it in.

```ruby
> require 'yaml'
=> true
> YAML.load_file('data.json')
=> {"data"=>["one", "two", "three"], "number"=>22}
```

It works. And for me, having not considered those two format related, this
isn't something I would have expected to work.

[source](http://yaml.org/spec/1.2/spec.html#id2759572)
