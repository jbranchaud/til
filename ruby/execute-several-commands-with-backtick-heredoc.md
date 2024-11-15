# Execute Several Commands With Backtick Heredoc

A fun feature of Ruby is that we can execute a command in a subprocess just by
wrapping it in backticks.

For instance, we might shell out to `git` to check if a file is tracked:

```ruby
`git ls-files --error-unmatch #{file_path} 2>/dev/null`
$?.success?
```

But what if we need to execute several commands? Perhaps they depend on one
another. We want them to run in the same subprocess.

For this, we can use the backtick version of a heredoc. That is a special
version of a heredoc where the delimiter is wrapped in backticks.

```ruby
puts <<`SHELL`
  # Set up trap
  trap 'echo "Cleaning up temp files"; rm -f *.tmp' EXIT
  
  # Create temporary file
  echo "test data" > work.tmp
  
  # Do some work
  cat work.tmp
  
  # Trap will clean up on exit
SHELL
```

Here we set up a `trap` for file cleanup on exit, then create a file, then do
something with the file, and that's it, the process exits (triggering the
trap).

[source](https://ruby-doc.org/3.3.6/syntax/literals_rdoc.html#label-Here+Document+Literals)
