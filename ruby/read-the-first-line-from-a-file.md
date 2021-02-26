# Read The First Line From A File

If I wanted to read the first line from a file with Ruby, I'd probably read the
whole thing in, split it by newlines, and grab the first.

```ruby
File.read('README.md').split(/\n/).first
```

This is inefficient in that it reads in the entire file. For small files this
won't matter, but for larger files it could become a bottleneck.

There is a method of doing this that is just as concise and streams the first
part of the file rather than reading it in its entirety. The `File.open` method
takes a block. This means you can pass a symbol-to-proc to it as the block
argument.

```ruby
> File.open('README.md', &:readline).strip
=> "# TIL"
> File.open('README.md', &:gets).strip
=> "# TIL"
```

Both `#readline` and `#gets` will grab the first line including the newline
character (hence the `#strip`). The only difference is that `#readline` will
raise an exception if the file is empty.

These methods both come from the `IO` module and [stream the file rather than
slurping the whole thing
in](https://blog.appsignal.com/2018/07/10/ruby-magic-slurping-and-streaming-files.html).

[source](https://stackoverflow.com/questions/1490138/reading-the-first-line-of-a-file-in-ruby)
