# Set default_url_options For Entire Application

There are a [number of
ways](https://github.com/rails/rails/issues/29992#issuecomment-575464112) to
set `default_url_options` for the various modules that need them. While the
development server can infer URL options for the most part, it needs them
explicitly defined for `ActionMailer`. You may also see the `ArgumentError:
Missing host to link to! Please provide the :host parameter, set
default_url_options[:host], or set :only_path to true` error when using a URL
helper. That's because the `routes` config also needs to know.

Instead of cobbling together default settings in several different places as
the issues arise, you can define them application-wide like so:

```ruby
# config/environments/development.rb
Rails.application.default_url_options = { host: 'localhost', port: 3000 }

Rails.application.configure do
 # ...
end
```

Add the `default_url_options` to `Rails.application` just outside of the
standard `configure` block in each of your environment config files. Now
everything should know how to generate full URLs.

Note: I've tested this out in a Rails 6.1 application.

[source](https://discuss.rubyonrails.org/t/define-host-so-absolute-urls-work-in-development-and-test/75085/10)
