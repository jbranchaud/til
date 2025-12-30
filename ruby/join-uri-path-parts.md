# Join URI Path Parts

The
[`URI.join`](https://ruby-doc.org/stdlib-2.5.1/libdoc/uri/rdoc/URI.html#method-c-join)
method seems like a handy way to combine a base URL with some subpath. However,
there are some subtle gotchas depending on where forward slashes appear in the
two arguments.

Let's first look at the, in my opinion, desired behavior:

```ruby
> URI.join("https://example.com/api/v1/", "users")
=> #<URI::HTTPS https://example.com/api/v1/users>
```

The base URL has a trailing slash and the path that I want to join to it has no
leading slash. The result is a path where `users` is joined to the end of the
base URL. That's what I'm looking for.

Now, let's see some variations on the above approach that give results that I
wasn't expecting and don't want.

```ruby
> URI.join("https://example.com/api/v1", "/users") # 1
=> #<URI::HTTPS https://example.com/users>
> URI.join("https://example.com/api/v1", "users") # 2
=> #<URI::HTTPS https://example.com/api/users>
> URI.join("https://example.com/api/v1/", "/users") # 3
=> #<URI::HTTPS https://example.com/users>
```

1. No trailing slash on the base URL. Leading slash on the path to join. The
   path portion of the base URL is wiped out and `/users` is joined in.
2. No trailing slash on the base URL. No leading slash on the path to join. The
   `users` path replaces the last part of the path in the base URL.
3. Both a trailing slash in the base URL and a leading slash in the path to
   join. Same behavior as 1.

I have two takeaways from this:
- Use with caution. If I'm going to use `URI.join` for this purpose, I need to
  be careful to only use the form in the first code block.
- The `URI.join` method is probably meant to be primarily used to join a domain
  (e.g. `http://example.com`) that has no path with some path segment.
