# Set Meta Tags In ERB Views

There are all kinds of meta tags that we may want to set for the pages that our
Rails app serves. A lot of these are for SEO and social sharing. Let's look at
how to add `og:description` meta tags to our views.

I'll start with a helper method in `app/helpers/application_helper.rb`:

```ruby
module ApplicationHelper
  def meta_description(desc)
    content_for(:description) { desc }
  end
end
```

Then, I'll update my `app/views/layouts/application.html.erb` to consume the
description when provided.

```ruby
<!DOCTYPE html>
<html>
  <head>
    <!-- ... -->

    <meta
      property="og:description"
      content="<%= content_for?(:description) ? yield(:description) : 'Default description' %>"
    >

    <!-- ... -->
  </head>

  <!-- ... -->
</html>
```

Now I have a default description for all my views that I can override as needed
with the `meta_description` helper.

```ruby
# app/views/posts/show.html.erb
<%= meta_description @post.body.split("\n").first %>

<!-- ... -->
```

If I reload the page and inspect the meta tags in `<head>`, I should find the
`og:description` tag with the corresponding value.

This can be extended to apply all the different meta tags (e.g. Open Graph and
Twitter) to make links to these pages render well across the internet.
