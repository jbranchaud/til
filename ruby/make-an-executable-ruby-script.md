# Make An Executable Ruby Script

In a unix environment with Ruby available, I can make a Ruby script. To do this
I stick some code in a Ruby file, like `database_url.rb`.

```ruby
result = `heroku pg:credentials:url DATABASE_URL --app my-app`
puts result.split("\n")[2].strip
```

And then execute that file with `ruby`:

```bash
$ ruby database_url.rb
```

I can instead make an executable file that doesn't need to be explicitly
invoked with the `ruby` command. To do this, I need to prefix my file with a
[shebang](https://unix.stackexchange.com/a/87600/5916) for
[`ruby`](https://devcenter.heroku.com/articles/ruby-binstub-shebang).

And I'll even just call the file `database_url` now, no file suffix.

```ruby
#!/usr/bin/env ruby

result = `heroku pg:credentials:url DATABASE_URL --app my-app`
puts result.split("\n")[2].strip
```

When executed, this script will see the first line and understand that it needs
to execute the rest of the script using `ruby` as the interpreter.

Like any other executable, you can call it as is, like so:

```ruby
$ database_url
```
