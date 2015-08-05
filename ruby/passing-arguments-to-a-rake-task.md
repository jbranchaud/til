# Passing Arguments To A Rake Task

You can create a rake task that takes arguments by including an array of
named arguments in the task declaration.

```ruby
task :greeting, [:name] do |task, args|
  puts "Hello, #{args.name}!"
end
```

You can then pass an argument to that task when invoking it.

```bash
$ rake greeting[World]
Hello, World!
```

[source](http://davidlesches.com/blog/passing-arguments-to-a-rails-rake-task)
