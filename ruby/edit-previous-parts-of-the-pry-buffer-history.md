# Edit Previous Parts Of The Pry Buffer History

Each line of Ruby you enter into a Pry session is recorded with a number in
the buffer history. Pry keeps this buffer history so that you can recall
parts of it for editing and subsequent execution.

If you use the `edit` command by itself, Pry will open the previous Ruby
statement in your default editor. But what if you want to edit a statement
from a while back? Or even a series of statements?

Use the `--in` flag with `edit` either specifying a single record in the
buffer history or a range of records.

```ruby
$ pry
[1] pry(main)> puts "Hello"
Hello
=> nil
[2] pry(main)> puts "World"
World
=> nil
[3] pry(main)> puts "People"
People
=> nil
[4] pry(main)> edit --in 1..2
Hello
World
=> nil
```
