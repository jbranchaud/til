# Extract A Column Of Data From A CSV File

Let's say I have just downloaded a medium-sized CSV of data onto my hard drive.
I want to exact one column of data from that CSV to inject into some other
tool/process.

Here is how I'd go about doing that with Ruby.

```ruby
require 'csv'

filename = "#{Dir.home}/Downloads/file.csv"
column_index = 2 # zero-indexed column of interest

# an array of collecting the values I want to extract
col_data = []

# read in the CSV into memory
csv_data = CSV.read(filename)

# pop headers out of the top of the array
csv_data.shift

# grab the column of interest from each row
csv_data.each { |row| col_data << row[column_index] }

# do something with the extract column of data
comma_separated_list = col_data.join(', ')
system "command -v pbcopy >/dev/null 2>&1 && echo '#{comma_separated_list}' | pbcopy"
```

All but the last two lines are pretty standard. We identify the file and column
of interest. Read in the CSV from that file and ditch the headers. Then we grab
that column's value for every entry in the CSV.

Then we need to do something with that data.

In my case, I want to turn those values into a comma-separated list and put it
on my clipboard. Those last two lines do just that.
