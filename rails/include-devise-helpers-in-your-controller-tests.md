# Include Devise Helpers In Your Controller Tests

For past versions of Devise, you could include `DeviseHelpers` as part of
`controller` or `request` type tests to have access to the `sign_in` and
`sign_out` helpers.

```ruby
RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end
```

As of [Devise
4.2.0+](https://github.com/heartcombo/devise/blob/master/CHANGELOG.md#420---2016-07-01),
the `Devise::TestHelpers` have been deprecated. The
`Devise::Test::ControllerHelpers` module should instead be included.

```ruby
RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, :type => :controller
end
```

[source](https://github.com/heartcombo/devise/blob/98fc5e8e396b66b826528811287ea6680a6d0757/lib/devise/test/controller_helpers.rb#L26)
