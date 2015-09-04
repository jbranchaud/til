# Invoking Rake Tasks Multiple Times

I have a rake task, `build`, that builds a single record for development
purposes. I want a supplemental rake task, `build:all`, that builds a bunch
of different records. To keep things dry, `build:all` should just invoke
`build` a number of times.

```ruby
namespace :build do
  task :all do
    predefined_list.each do |data|
      Rake::Task["build"].invoke(data)
    end
  end
end
```

This doesn't work though. No matter how many items are in the list, the
`build` task only seems to get run once. This is because by default tasks
can only be invoked once in a given context. To get around this, the task
needs to be _reenabled_ after each invocation.

```ruby
namespace :build do
  task :all do
    predefined_list.each do |data|
      Rake::Task["build"].invoke(data)
      Rake::Task["build"].reenable
    end
  end
end
```
