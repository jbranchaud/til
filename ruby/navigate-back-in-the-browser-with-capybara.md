# Navigate Back In The Browser With Capybara

There are two ways to navigate back to a previous page. Capybara is driving
the browser and it can be instructed to go back using its built-in command
or by executing some JavaScript.

```ruby
page.go_back
```

or

```ruby
page.evaluate_script('window.history.back()')
```
