# Parse Query Params From A URL

For all of the conveniences that Ruby and Rails affords a developer through
their expansive APIs, I am always surprised that it is hard to inspect the
query params in a URL.

Let's take a URL and walk through the steps it takes to pull out the value of a
query param.

Here's a URL:

```ruby
url = "https://example.com?taco=bell&taco_count=3"
=> "https://example.com?taco=bell&taco_count=3"
```

Let's parse the URL with `URI`:

```ruby
> URI(url)
=> #<URI::HTTPS https://example.com?taco=bell&taco_count=3>
```

Then grab the `query` part of that `URI`:

```ruby
> URI(url).query
=> "taco=bell&taco_count=3"
```

This is an unparsed string. In a Rails context, this can be parsed with
`Rack::Utils.parse_nested_query`:

```ruby
> query_params = Rack::Utils.parse_nested_query(URI(url).query)
=> {"taco"=>"bell", "taco_count"=>"3"}
```

And now we have a hash of values we can inspect:

```ruby
> query_params["taco_count"]
=> "3"
```

Be sure to do _string_ and not _symbol_ hash access here.

These steps can be wrapped up into a method:

```ruby
module UrlHelpers
  def query_params(url)
    unparsed_query_params = URI(url).query
    Rack::Utils.parse_nested_query(unparsed_query_params)
  end
end
```

[source](https://stackoverflow.com/a/3218018/535590)
