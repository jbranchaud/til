# Parsing A CSV With Quotes In The Data

If a CSV contains unescaped quote characters--like you might find in a CSV full
of measurement data--then Ruby's
[CSV](https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV.html) library will
be unable to parse it.

Here is what happens with a line of CSV about some lumber:

```ruby
> require 'csv'
> CSV.parse_line('oak,2",4"')
CSV::MalformedCSVError (Illegal quoting in line 1.)
```

However, we can enable some more lenient, liberal parsing of the data with the
`liberal_parsing` argument.

```ruby
> require 'csv'
> CSV.parse_line('oak,2",4"', liberal_parsing: true)
=> ["oak", "2\"", "4\""]
```

[source](https://blog.bigbinary.com/2016/11/22/ruby-2-4-introduces-liberal_parsing-option-for-parsing-bad-csv-data.html)
