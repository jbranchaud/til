# Why Redirect And Return In Controllers

A fairly common idiom in Rails controller actions is a `redirect_to` followed
by an `and return`.

```ruby
def show
  redirect_to sign_in_path and return if current_user.blank?

  book = Book.find(params[:id])

  render book
end
```

Because a `render` comes later in the controller action, we need to _early
return_ after the redirect to avoid multiple render/redirect warnings.

It is important to use `and` here instead of `&&` because of logical operator
precedence.

If we used `&&` instead:

```ruby
  redirect_to sign_in_path && return if current_user.blank?
```

The `redirect_to` would get `nil` (the result of `sign_in_path && nil`). If we
did want to use `&&`, we'd need to be diligent with method call parentheses.

```ruby
  redirect_to(sign_in_path) && return if current_user.blank?
```

In this case, `redirect_to` would actually get called with a path string and
the `return` would be called after that.

[source](https://stackoverflow.com/a/37211314/535590)
