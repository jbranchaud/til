# Truncate Almost All Tables

The
[`database_cleaner`](https://github.com/DatabaseCleaner/database_cleaner)
gem is a handy way to make sure you have a consistent database context for
each test example or suite. One `database_cleaner` strategy that can be used
is the `truncation` strategy. This truncates the data from all the tables by
default. This is not ideal for *fixed* tables that contain domain-specific
data because you end up having to do way more test setup than should be
necessary. Fortunately, specific tables can be excepted by the truncation
strategy using the `except` option.

For instance, if we have a standard set of roles for users of our
application, we can except that table from truncation with a line like the
following in our `rails_helper.rb` file:

```ruby
DatabaseCleaner.strategy = :truncation, {:except => %w[roles]}
```
