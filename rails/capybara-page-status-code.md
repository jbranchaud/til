# Capybara Page Status Code

To quickly determine if a page is rendering as expected or not, you can
check the status code of the page. If your page is rendering successfully,
you'll see something like this:

```ruby
> page.status_code
# => 200
```

If some sort of application authorization logic is causing the page to not
render as normal, you may see something like this:

```ruby
> page.status_code
# => 403
```
