# If You Detect None

The
[`Enumerable#detect`](http://ruby-doc.org/core-2.2.3/Enumerable.html#method-i-detect)
method, which is synonymous with `#find`, can be given an optional argument,
`ifnone`, that is called when nothing in the array meets the conditional in
the block. Though I am not sure how this is practically useful and cannot
find an example of it in use, this contrived example illustrates how it
works.

```ruby
# without the fallback behavior
> [2,4,6,8].detect { |x| x.odd? }
=> nil

# with a proc as an argument
> [2,4,6,8].detect(->{0}) { |x| x.odd? }
=> 0
```

The last example can also be written as:

```ruby
> [2,4,6,8].detect(->{0}, &:odd?)
=> 0
```

And if you want to be really explicit:

```ruby
> [2,4,6,8].detect(ifnone=->{0}, &:odd?)
=> 0
```
