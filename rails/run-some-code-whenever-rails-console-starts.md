# Run Some Code Whenever Rails Console Starts

It can be handy to run some code whenever the `rails console` command is run.
You may want to have some modules required, some variables set up, or, both
fancy and practical, default to the read replica database in production.

Rails provides a hook into the console startup with the `console` block in
`config/application.rb`.

Here is what it looks like to `puts` out the environment:

```ruby
class Application < Rails::Application
  # everything else ...

  console do
    puts '############################################'
    puts 'Connected to the #{Rails.env.upcase} console'
    puts '############################################'
  end
end
```

To avoid cluttering `config/application.rb` with a bunch of console-specific
logic, you can move it to another file and then have the console block require
that file with the `-r` flag.

```ruby
class Application < Rails::Application
  console do
    ARGV.push "-r", Rails.root.join("lib/console.rb")
  end
end
```

[source](https://til.hashrocket.com/posts/avb2v3ubdt-pass-a-block-on-console-load)
