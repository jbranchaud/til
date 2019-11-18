# Customize The Path Of A Resource Route

The `:path` option allows you to customize the path used by a resource route in
Rails' `config/routes.rb` file. This is handy if you have a multi-word resource
that you would like to use dashes in the path.

For instance

```ruby
resources :audio_books
```

would have paths like `/audio_books` and `/audio_books/:id`.

By specifying the `:path` option

```ruby
resources :audio_books, path: 'audio-books'
```

the paths end up like `/audio-books` and `/audio-books/id`.

[source](https://stackoverflow.com/questions/5334465/routes-with-dash-instead-of-underscore-in-ruby-on-rails)
