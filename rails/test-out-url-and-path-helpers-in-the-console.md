# Test Out URL And Path Helpers In The Console

Rails has fancy metaprogrammed URL and path helpers generated from the
`config/routes.rb` file. There is a ton of configurability to these routes. It
can sometimes be hard to know exactly how they'll behave or what the generated
route helper will look like. In those cases, we may want to test them out in
the console.

The Rails console doesn't have the same things autoloaded as mailers and views
where we tend use these route helpers. So, we can reference them through
`Rails.application.routes.url_helpers`.

From there we can run both `*_path` route helpers.

```ruby
> Rails.application.routes.url_helpers
    .api_v1_post_with_slugged_title_path(
      slug: 123,
      slugged_title: 'a-recent-path'
    )

=> "/api/v1/posts/123/a-recent-path"
```

and `*_url` path helpers.

```ruby
> Rails.application.routes.url_helpers
    .api_v1_post_with_slugged_title_url(
      slug: 123,
      slugged_title: 'a-recent-path'
    )

=> "http://localhost:3000/api/v1/posts/123/a-recent-path"
```

For the `*_url` path helpers, make sure you have [`default_url_options`
set](set-default-url-options-for-entire-application.md).

[source](https://stackoverflow.com/a/13553422/535590)
