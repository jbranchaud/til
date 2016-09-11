# Bypass Template Rendering

Generally when rendering a response to a request in a Phoenix app, the
controller will make a render call that targets a specific template. If it
suits our needs, we can skip writing a template and bypass the template
portion of the response pipeline by implementing our own `render` function
directly in the view module.

Consider the following route and controller action:

```elixir
# web/router.ex
get "/hello", UserController, :hello

# web/controllers/user_controller.ex
def hello(conn, _params) do
  render(conn, "hello.html")
end
```

The render call would normally trigger a corresponding template function,
but we bypass it by adding the following function to our view module:

```elixir
# web/views/user_view.ex
def render("hello.html", _assigns) do
  "Hello, World!"
end
```

Visiting `/hello` will render a page with the view's layout and the words
"Hello, World!".
