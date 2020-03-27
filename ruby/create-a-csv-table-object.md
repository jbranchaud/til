# Create A CSV::Table Object

When you parse a file or string using `CSV.parse` (with `headers = true`) you
get a
[`CSV::Table`](https://ruby-doc.org/stdlib-2.5.1/libdoc/csv/rdoc/CSV/Table.html)
object in response. This object can be used to read what was in a file or it
can be used to create a new file. It is also handy as a potential test object
if you want to assume, but omit, file reading in a unit test.

You can create a `CSV::Table` one of the following two ways. First, with a file:

```ruby
require 'csv'

file = # read in file
csv_table = CSV.parse(file, headers: true)
```

Second, with a string, or even better, a HEREDOC:

```ruby
require 'csv'

csv_table =
  CSV.parse(<<-CSV, headers: true)
    first_name,last_name,taco
    Josh,Branchaud,"Al Pastor"
    Jake,Worth,Cauliflower
  CSV

csv_table.headers
#=> ["first_name", "last_name", "taco"]
```

From here, you can do what you need with it, whether that is using it in a test
or writing it to a file.

[source](https://ruby-doc.org/stdlib-2.6.3/libdoc/csv/rdoc/CSV.html#class-CSV-label-CSV+with+headers)
