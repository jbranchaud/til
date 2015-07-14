# Ignore Poltergeist JavaScript Errors

Poltergeist with PhantomJS (<2.0) does not support JavaScript's `bind()`
method. This means that when executing an integration test that exercises
JavaScript with the `bind()` method, an error will occur. If you cannot
simply upgrade to a version of PhantomJS that supports `bind()`, then what
can you do?

Ignore the error!

This can be achieved by placing the following rescue block in the
appropriate place.

```ruby
rescue Capybara::Poltergeist::JavascriptError
```

Use this in moderation. You want to make sure you don't ignore actual
JavaScript errors.

[source](http://stackoverflow.com/questions/22020680/temporarily-set-js-errors-to-false-in-poltergeist)
