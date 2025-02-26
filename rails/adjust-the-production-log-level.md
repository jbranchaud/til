# Adjust The Production Log Level

A Rails app by default takes on the `debug` log level. This is great for
development because it spits out a lot of information as you build and debug.

That's going to typically be a bit too noisy for a production environment
though. That is why Rails ships with the `config/environments/production.rb`
file configured to the `info` log level.

```ruby
# config/environments/production.rb
Rails.application.configure do

  # ...

  # "info" includes generic and useful information about system operation, but avoids logging too much
  # information to avoid inadvertent exposure of personally identifiable information (PII). If you
  # want to log everything, set the level to "debug".
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # ...
end
```

Sometimes, like when we're trying to track down some buggy behavior, we may
want to switch Rails from one log level to another. That's why it is configured
by the `RAILS_LOG_LEVEL` env var and otherwise falls back to `info`.

To, for example, switch production over to the `debug` log level, we'd first
change the `RAILS_LOG_LEVEL` env var to `debug`. Then we'd need to make sure
our Rails app is restarted so that the config change is picked up. Heroku's
`heroku config:set` will do that automatically. Depending on your setup, you
may need to manually restart your web server (e.g. Puma).
