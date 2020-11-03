# Read In Environment-Specific Config Values

The [`config_for`](https://apidock.com/rails/Rails/Application/config_for)
method allows you to read in a YAML file for the current environment in your
config files. These YAML files need to be located in the `config` directory.

For instance, let's say you have `config/extra_settings.yml`:

```yml
development:
  support_email: support+dev@test.com

production:
  support_email: support@test.com
```

You can read that file in as part of your `application.rb` config setup:

```ruby
# config/application.rb
module MyApp
  class Application < Rails::Application
    extra_settings = config_for(:extra_settings)
    set_support_email(extra_settings.fetch(:support_email))
  end
end
```

In `development` this call to `config_for` would return a hash of the values
under `development`. Likewise in `production`.
