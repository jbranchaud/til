# Check Return Status Of Running A Shell Command

There are [many
ways](http://tech.natemurray.com/2007/03/ruby-shell-commands.html) to run a
shell command in a Ruby context. One of the most common is to place the command
inside backticks. It runs the command in a subshell.

The standard output (`stdout`) from running the command is the return value of
the statement. Ruby also captures details about the previously run command in
the global `$?` variable.


```ruby
> `true`
=> ""
> $?.exitstatus
=> 0

> `false`
=> ""
> $?.exitstatus
=> 1

> `echo 'hello' && exit 2`
=> "hello\n"
> $?
=> #<Process::Status: pid 12284 exit 2>
> $?.exitstatus
=> 2
```

The value captured in `$?` is a `Process::Status` object. It can tell us the
exit status of the process with `#exitstatus`.
