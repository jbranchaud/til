# Show Public Methods With Pry

Open up a [`pry`](https://github.com/pry/pry) session and use the `-m` flag
with the `ls` command to show just the public methods for an object.

```ruby
> ls -m :hello
Comparable#methods: <  <=  >  >=  between?
Symbol#methods:
  <=>  as_json      empty?    length              slice     to_sym
  ==   capitalize   encoding  match               succ      upcase
  ===  casecmp      id2name   next                swapcase
  =~   downcase     inspect   pretty_print_cycle  to_proc
  []   duplicable?  intern    size                to_s
```

[source](https://github.com/pry/pry/wiki/State-navigation#Ls)
