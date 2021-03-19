# Link To The Current Page With Query Params

The `link_to` method is an ActionView helper for generating an `a` tag within a
Rails view. There are two arguments that tend to comprise this method: the link
text and a path helper.

```ruby
<%= link_to 'Home', root_path %>
```

The `link_to` method can be used to generate a link to the current page with
query params. You can do this be providing a hash instead of a path helper as
the second argument.

```ruby
<%= link_to "All", {filter: 'all'} %>
<%= link_to "New", {filter: 'new'} %>
<%= link_to "Posted", {filter: 'posted'} %>
```

The hash can contain one or more key-value pairs which will be turned into
query params and appended to the end of the current base path.

If these are part of the `posts` index page, then they will render as:

```html
<a href="/posts?filter=all">All</a>
<a href="/posts?filter=new">New</a>
<a href="/posts?filter=posted">Posted</a>
```

This is a great way to create links for a Rails action that presents different
data based on query params. Often this is an index page where filtering is
needed.

[source](https://gorails.com/episodes/rails-link-to-current-page-with-params)
