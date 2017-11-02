# Scroll To Top Of Page With Capybara

During a browser-based Capybara test, you may get partially scrolled down in
the page which can obscure or overlay DOM elements. A sure-fire way to
scroll back to the top is by executing the following line of JavaScript:

```ruby
page.execute_script "window.scrollTo(0,0)"
```

This will scroll to `0,0` which is the top-most, left-most corner of the
browser.
