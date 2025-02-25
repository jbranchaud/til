# Enforce Locals Passed To A Partial

I have a big form partial (`_form.html.erb`) that is rendered by several
different _new_ and _edit_ views. It's hard to tell at a glance, but the
partial requires that `blogmark` and `cancel_path` are included as locals when
it is rendered.

As of [Rails 7.1](https://github.com/rails/rails/pull/45602), we now have a
built-in way to enforce locals passed to a partial. We can add a magic comment
at the top of the partial that specifies the locals:

```ruby
<%# locals: (blogmark:, cancel_path:) -%>
<%= form_with(model: blogmark, local: true, class: "w-full max-w-3xl mb-8") do |form| %>
  <% ... %>
<% end %>
```

This particular ERB magic comment declares that
[`blogmark`](https://still.visualmode.dev/blogmarks) and `cancel_path` are
required locals.

So, what happens if I have a `new.html.erb` view that looks like this:

```ruby
<h1>New Blogmark</h1>

<%= render 'blogmarks/form', blogmark: @blogmark %>
```

When I try to view the page, an error is raised:

```
Showing /Some/path/app/views/blogmarks/_form.html.erb where line # raised:

missing local: :cancel_path for app/views/blogmarks/_form.html.erb
```

Updating the `render` statement to include a `cancel_path` local fixes the
issue.

[source](https://gorails.com/episodes/template-locals-in-rails-7-1)
