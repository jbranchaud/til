# Go To Beginning And End Of Line

There are two movements that I often find useful in Vim when trying to position
my cursor relative to the current line.

- `0` - go to the first character of the line
- `$` - go to the end of the line

For instance, I may use `0` to jump to beginning of a line so that I can then
make a block-visual selection of several lines to insert some text in front of
each line.

Or perhaps I'm already in visual mode and I want to move the cursor (and visual
selection) to the end of the line. I hit `$` to do that. Then I might `y`
(yank) or `c` (delete into insert mode).

It's also worth noting that with code indentation, `0` moves the cursor to the
very first position of the line whereas `^` moves the cursor to the first
non-whitespace character. The former essentially accounts for code indentation.
For example, imagine you're in the middle of line 3 in the following example.
Depending on what you're trying to do, you may want to jump to one or the other
position.

```ruby
class Greeting
  def hello(name)
    puts "Hello, #{name || 'world'}!" # say hi
  end
end
```

See `:h 0` for Vim help files on these motions. They are all located near each
other.
