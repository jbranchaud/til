# Run A Rake Task Programmatically

Typically the way to run a rake task is with the `rake` command from the
command line.

```bash
$ rake example:env
```

What if you have a rake task that you want to invoke as part of a Ruby script
or from somewhere in your Rails codebase?

Your tasks can be called programmatically as well.

Consider these two rake tasks:

```ruby
namespace :example do
  task :env do
    puts "Current Environment: #{Rails.env.upcase}"
  end

  task :message, [:msg] do |task, args|
    puts "Message: #{args[:msg]}"
  end
end
```

These can be called from somewhere else by referencing and invoking them like
so.

```ruby
Rake::Task["example:env"].invoke
Rake::Task["example:message"].invoke("Nice rake task!")
```
