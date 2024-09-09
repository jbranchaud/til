# Generate A Rails App From The Main Branch

Typically you are going to want to generate a Rails app using some officially
released version of the framework. These releases have been thoroughly tested,
have received patches, and can guarantee a certain level of stability.

However, if you are wanting to try out the latest, unreleased features, you may
want to generate a fresh Rails app based off the current state of the `main`
branch of the `rails` repository.

To do this, add the `--main` flag:

```bash
$ rails new rails_app_on_main --main
```

Toward the top of your app's `Gemfile`, you'll see that `rails` is pointed to
the `main` branch of their repo:

```ruby
# Use main development branch of Rails
gem "rails", github: "rails/rails", branch: "main"
```

See `rails new --help` for more details

[source](https://x.com/gregmolnar/status/1832720168264286571)
