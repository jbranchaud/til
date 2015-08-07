# Rake Only Lists Tasks With Descriptions

Rake describes the `-T` flag as

> Display the tasks (matching optional PATTERN) with descriptions, then exit.

And `rake -T` does just exactly that. It lists all the tasks with
descriptions. Any rake task that you define without a `desc` will not be
included.

Consider the following rake task definitions

```ruby
desc 'foobar does this and that'
task :foobar do
  puts 'this and that'
end

task :foobaz do
  puts 'not so much'
end
```

This is what I get when listing the rake tasks filtered by _foo_

```bash
$ rake -T foo
rake foobar  # foobar does this and that
```

The `foobar` task (which has a description) is listed, but `foobaz` is not.

A hack of sorts to get around this is to use the `-P` flag which will end up
listing all tasks even if they do not have a description (`rake -P | grep
'foo'`).
