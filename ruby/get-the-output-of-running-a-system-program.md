# Get The Output Of Running A System Program

Ruby has a [variety of ways](https://stackoverflow.com/a/18623297/535590) to
execute a system program within a Ruby process. The backticks approach is the
handy shorthand approach to reach for if you want to capture the output of the
command.

For instance, let's say I want to capture the connection string credentials
output by running a `heroku` command. When the command is wrapped in backticks,
Ruby will execute it in a subprocess and the output of the command will be the
return value.

```ruby
result = `heroku pg:credentials:url DATABASE_URL --app my-app`

# extract connection details
connection_info = result.split("\n")[2].strip
```

With the result in hand, I can use Ruby to parse out the details I'm interested
in.

Backticks does two other nice things. It allows for string interpolation and it
puts the process status (e.g. exit code) on
[`$?`](check-return-status-of-running-a-shell-command.md).
