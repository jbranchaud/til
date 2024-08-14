# Avoid Accidentally Disabling Pry

I was recently working on a test that needed to mock an environment variable in
order to observe the behavior under test. I initially ended up with the
following lines in a `before` block.

```ruby
before do
  allow(ENV).to receive(:[]).and_return("")
  allow(ENV).to receive(:[]).with("API_SERVER_URL").and_return("localhost")
end
```

The idea was to create a "clean" `ENV` for the test and then layer in any
relevant environment variables from there.

This is a misguided approach for a couple reasons. One particular and
hard-to-debug issue is that this mocking of `ENV` accidentally disabled Pry
(i.e. `binding.pry`). So once I was having issues with my test, I couldn't even
inspect the code at runtime. It would skip right past any `binding.pry`
statement I added.

What happened is that [Pry (specifically `pry-rails`) looks for
`ENV['DISABLE_PRY_RAILS']`](https://github.com/pry/pry-rails/blob/d8d0c6d87a5b8a3e570e0c80910fb80068f3553c/lib/pry-rails.rb#L6)
and if that value is _truthy_ then it won't require the various `pry-rails`
modules.

The first `allow` has `ENV` responding with `""` which is truthy and will
result in Pry being disabled.

A more appropriate default would be `nil`. Also consider that there are many
ways to access `ENV`, such as `#fetch`.
