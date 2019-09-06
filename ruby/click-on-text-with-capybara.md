# Click On Text With Capybara

Traditionally, web apps have clickable text in the form of links and buttons.
[Capybara's
`click_on`](https://www.rubydoc.info/github/jnicklas/capybara/Capybara/Node/Actions#click_link_or_button-instance_method)
method is made for just this.

```ruby
click_on("Home") # for <a ... >Home</a>
click_on("Submit") # for <button ...>Submit</button>
```

A lot of more modern, JS-heavy apps stick click handlers on all kinds of
elements. If you want to test what happens when you click some text that is not
a link or button, `click_on` won't work. Instead, you'll need to find the
element and
[`click`](https://rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Element#click-instance_method)
on it.

```ruby
find("span", text: "Click Me").click
```
