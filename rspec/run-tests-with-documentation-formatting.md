# Run Tests With Documentation Formatting

Typically when you invoke `rspec` on a file or an entire suite of tests, you'll
see a bunch of dots (`.`) and maybe a couple `F`s.

```
$ rspec spec/models/user_spec.rb

.F...........
```

That style of output is called _progress_ formatting.

That's not the only option for formatting output from RSpec. Another one is
_documentation_ formatting.

Use the `--format` flag to specify a format like `documentation`. Or `-f d`
works as a shorthand.

```
$ rspec --format documentation spec/models/user_spec.rb

User
  #valid?
    without required fields
      returns false
    with invalid email
      returns false (FAILED - 1)
    with invalid password
      too short
        returns false
      no upper case letter
        returns false
```

The resulting test output is a readable format that leverages the `describe`,
`context`, and `it` descriptions that we craft for each test.

[source](https://relishapp.com/rspec/rspec-core/v/2-6/docs/command-line/format-option)
