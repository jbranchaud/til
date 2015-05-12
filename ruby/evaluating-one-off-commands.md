# Evaluating One-Off Commands

When I need to quickly test something out in Ruby, I will often reach for
`irb`. However, there is an even quicker way to send a line of code to
ruby for evaluation. Use the `ruby` binary with the `-e` flag followed
by your line of ruby. For instance,

```
$ ruby -e 'puts Class.ancestors'
[Class, Module, Object, Kernel, BasicObject]
```
