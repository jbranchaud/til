# Create Listing Of All Middleman Pages

Middleman is a handy tool for quickly throwing together a bunch of static
pages with layout and templating help at the ready. Once you have a handful
of pages up and running, you'll probably want a way to quickly navigate to
them. You can add a quick listing of all the pages with a couple helpers
provided by Middleman.

```erb
<ul>
  <% sitemap.resources.each do |resource| %>
    <li><%= link_to(resource.path, resource.path) %></li>
  <% end %>
</ul>
```

The `sitemap.resources` variable will contain a list of all the resources
that get processed and served by the Middleman app. The `link_to` helper
makes it easy to turn those into links.

Because `resources` includes images and other assets, you may want to filter
down to just `html` files which could look something like the following:

```erb
<ul>
  <% sitemap.resources
       .select { |resource| resource.path =~ /html$/ }
       .each do |resource|
  %>
    <li><%= link_to(resource.path, resource.path) %></li>
  <% end %>
</ul>
```

Just add the snippet to whatever page you'd like the page listing to appear
on.
