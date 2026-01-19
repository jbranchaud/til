# Check The Current Named Log Level

I'm connected to a `rails console` session for an active Rails app. I want to
check the current log level.

```ruby
> Rails.logger.level
=> 1
```

The `1` doesn't mean much to me at a glance. I can translate that to the
severity level using the `Logger::SEV_LABLE` constant.

```ruby
[44] pry(main)> Logger::SEV_LABEL[Rails.logger.level]
=> "INFO"
```

Ah yes, `INFO`, that makes sense as the default.

I can see all the severity levels by inspecting the constant itself.

```ruby
[45] pry(main)> Logger::SEV_LABEL
=> ["DEBUG", "INFO", "WARN", "ERROR", "FATAL", "ANY"]
```

As I convenience, I can set the label using the index, the string, or even a
symbol.

```ruby
> Rails.logger.level
=> 1
> Rails.logger.level = "WARN"
=> "WARN"
> Rails.logger.level
=> 2
> Rails.logger.level = :debug
=> :debug
> Rails.logger.level
=> 0
```

See the [Debugging Rails Applications
guide](https://guides.rubyonrails.org/debugging_rails_applications.html#log-levels)
for more details.
