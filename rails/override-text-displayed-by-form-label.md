# Override Text Displayed By Form Label

Rails does a good job with the default text displayed by a form label. It takes
the primary symbol value you give it and capitalizes that. And that is often
good enough.

```ruby
<%= form_with(model: post) do |form| %>
  <%= form.label :title, class: "text-sm font-medium text-gray-700" %>
  <%= form.text_field :title, required: true, class: "..." %>
<% end %>
```

This will yield a label value of _Title_.

Sometimes, however, the casing needs to be different or you need entirely
different text. Take this URL field for example. Rails will convert `:url` into
_Url_ for the label text. Not ideal. I can override the default with a second
positional argument, in this case, `"URL"`.

```ruby
<%= form_with(model: post) do |form| %>
  <%= form.label :url, "URL", class: "text-sm font-medium text-gray-700" %>
  <%= form.url_field :url, required: true, class: "..." %>
<% end %>
```

The [Rails docs have another good
example](https://guides.rubyonrails.org/form_helpers.html#a-generic-search-form).
A label with a value of `query` that is overridden to display "Search for:".

```ruby
<%= form_with url: "/search", method: :get do |form| %>
  <%= form.label :query, "Search for:" %>
  <%= form.search_field :query %>
  <%= form.submit "Search" %>
<% end %>
```
