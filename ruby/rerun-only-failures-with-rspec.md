# Rerun Only Failures With RSpec

After running a big test suite, I may have a bunch of output on the screen
including the results of a couple test failures. I like to bring the context
of the test failures front and center and make sure they are consistent test
failures (not flickering failures). Instead of copying and pasting each
failure, I can rerun `rspec` in a way that executes only the test cases that
failed.

```
$ rspec --only-failures
```

This feature requires that you set a file for RSpec to persist some state
between runs. Do this in the `spec/spec_helper.rb` file. For example:

```ruby
RSpec.configure do |config|
  config.example_status_persistence_file_path = "spec/examples.txt"
end
```

See more details
[here](https://relishapp.com/rspec/rspec-core/docs/command-line/only-failures).

h/t Brian Dunn
