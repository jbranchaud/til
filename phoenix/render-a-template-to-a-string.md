# Render A Template To A String

Templates in a [Phoenix](http://www.phoenixframework.org/) application
ultimately get compiled to functions that can be quickly rendered with the
necessary data. We can take a look at how a template will be rendered using
[`Phoenix.View.render_to_string/3`](https://hexdocs.pm/phoenix/Phoenix.View.html#render_to_string/3).

First, we need a template:

```elixir
# user.html.eex
<h1><%= @user.first_name %></h1>
<h5><%= @user.username %> (<%= @user.email %>)</h5>
```

We can then render that template for the view with some user:

```elixir
> user = %User{first_name: "Liz", last_name: "Lemon", username: "llemon", email: "lizlemon@nbc.com"}
%MyApp.User{...}

> Phoenix.View.Render_to_string(MyApp.UserView, "user.html", user: user)
"<h1>Liz</h1>\n<h5>llemon (lizlemon@nbc.com)</h5>\n"
```
