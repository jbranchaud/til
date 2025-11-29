# Install And Require Gems Inline Without Gemfile

[Bundler](https://bundler.io/) has an _inline_ feature where you can declare
gems that should be installed and required for the current file without the use
of a `Gemfile`. This is useful for creating a single-file Ruby script that can
define its own dependencies.

Require `"bundler/inline"` and then add a `gemfile` block toward the top of the
script to specify the source and any gems.

```ruby
require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "httparty"
end
```

When the script gets run (e.g. `ruby script.rb`), it will install the gems (if
they haven't already been installed) and then run the script. You can specify
version constraints just like you'd do in a `Gemfile`.

Here is a single-file script using this approach that I wrote to interact with
the Kit API.

```ruby
#!/usr/bin/env ruby
require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "httparty"
end

require "json"
require_relative "kit_client"

API_SECRET = ENV["KIT_API_SECRET"]

def fetch_all_tags(api_secret)
  client = KitClient.new("https://api.kit.com/v4", api_secret)

  tags = []
  after_cursor = nil

  loop do
    params = {per_page: 1000}
    params[:after] = after_cursor if after_cursor

    response = client.get("/tags", params)

    data = JSON.parse(response.body)
    tags.concat(data["tags"])

    break unless data["pagination"]["has_next_page"]
    after_cursor = data["pagination"]["end_cursor"]
  end

  tags
end

tags = fetch_all_tags(API_SECRET)

tags.each do |tag|
  puts tag
end
```

Because I've specified the shebang at the top of the file (and assuming I've
`chmod +x fetch_tags.rb`), I can run this directly as a script with
`./fetch_tags.rb`.

[source](https://bundler.io/guides/bundler_in_a_single_file_ruby_script.html)
