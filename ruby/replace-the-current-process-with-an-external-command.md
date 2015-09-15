# Replace The Current Process With An External Command

Ruby's
[`Kernel#exec`](http://ruby-doc.org/core-2.2.3/Kernel.html#method-i-exec)
method can be used to run an external command. What differentiates it from
executing commands with the likes of back ticks or `%x[]` is that instead of
forking a child process, it replaces the current process.

For instance, the following ruby script, when executed, will replace itself
with an `irb` session.

```ruby
Kernel.exec('irb')
```

The external command will even benefit from the existing environment. For
example, if I set the following environment variable

```bash
$ export GREETING=hello
```

and then execute a file containing

```ruby
Kernel.exec('echo $GREETING')
```

I can expect to see `hello` printed to stdout.
