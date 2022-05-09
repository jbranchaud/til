# Exit A Process With An Error Message

If you want to exit a Ruby process with an unsuccessful error code like `1`,
you can use
[`Kernel.exit`](https://ruby-doc.org/core-3.1.2/Kernel.html#method-i-exit).

```ruby
if arg_is_missing?
  exit 1
end
```

The non-zero status code means this will work great in a scripting scenario,
like `ruby script.rb && echo 'success'`. If the script has to exit early, it
won't print 'success'.

That's fine, but it doesn't give the program a chance to tell us _why_ the
program exited early.

`Kernel` has another method
[`abort`](https://ruby-doc.org/core-3.1.2/Kernel.html#method-i-abort) that does
the same thing as `exit 1` while also printing a message to `STDERR`.

```ruby
if arg_is_missing?
  abort 'The missing argument must be supplied'
end
```

This is handy if you want to communicate more than just the error code. The
program still exits early with an error code of `1`. And it prints that message
to `STDERR`.

[source](https://stackoverflow.com/a/23340693/535590)
