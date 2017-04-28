# Ins And Outs Of Pry

When executing commands during a [Pry](http://pryrepl.org/) session, you'll
see an incrementing number for each prompt as you enter each statement.
These numbers can be used to look up the inputs and outputs of each
statement executed during the session. The statements and their results are
made available in the array-like `_in_` and `_out_` objects.

```ruby
[1] pry(main)> :one
=> :one
[2] pry(main)> 1 + 1
=> 2
[3] pry(main)> ["t", "h", "r", "e", "e"].join
=> "three"
[4] pry(main)> _in_.to_a
=> [nil, ":one\n", "1 + 1\n", "[\"t\", \"h\", \"r\", \"e\", \"e\"].join\n"]
[5] pry(main)> _out_.to_a
=> [nil, :one, 2, "three", [nil, ":one\n", "1 + 1\n", "[\"t\", \"h\", \"r\", \"e\", \"e\"].join\n"]]
[6] pry(main)> _out_[2]
=> 2
[7] pry(main)> _in_[2]
=> "1 + 1\n"
```

[source](https://github.com/pry/pry/wiki/Special-Locals#In_and_out)
