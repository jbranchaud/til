# Rebuild Tailwind Bundle For Dev Server

If you're using the TailwindCSS gem in your Rails app:

```ruby
# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "tailwindcss-rails"
```

you may find that as you add and adjust styles in your views, refreshing the
page doesn't take any styling effects. That is because the tailwind bundle gets
built with just the style rules that were used at the time it was generated.

In development, as we're working, we expect the styles used by our app to
actively changed. And we don't mind a little performance hit to have the bundle
rebuilt. In that case, we can instruct `puma` to _Live Rebuild_ in
`development` with the `tailwindcss` plugin.

```ruby
# config/puma.rb

# Enable TailwindCSS rebuild in development
plugin :tailwindcss if ENV.fetch("RAILS_ENV", "development") == "development"
```

This has `rails server` run a watch process in the background that live
rebuilds the bundle.

[source](https://github.com/rails/tailwindcss-rails?tab=readme-ov-file#puma-plugin)
