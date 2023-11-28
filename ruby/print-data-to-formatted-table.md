# Print Data To Formatted Table

Often when I'm doing some debugging or reporting from the Ruby/Rails console, I
end up with a chunk of data that I'd like to share. Usually I'd like something
that I can copy into the text area of Slack or a project management tool.
Copying and pasting a pretty-printed hash isn't bad, but a nicely formatted
table would be even better.

Here is a small method I can copy and paste into the console:

```ruby
def print_to_table(headings, data)
  # Calculate column widths
  column_widths = headings.each_with_index.map do |heading, index|
    [heading.size, *data.map { |row| row[index].to_s.size }].max
  end

  # Method to format a row
  def format_row(row, widths)
    row.each_with_index.map { |item, index| item.to_s.ljust(widths[index]) }.join(" | ")
  end

  # Print headings
  puts format_row(headings, column_widths)
  puts "-" * column_widths.sum + "-" * (column_widths.size * 3 - 3)

  # Print data
  data.each do |row|
    puts format_row(row, column_widths)
  end
end
```

And then I can run it like so to get formatted table that can be copy-pasted
elsewhere:

```ruby
> headings = [:id, :name, :role]
=> [:id, :name, :role]
> data = [
    [123, 'Bob', 'Burger flipper'],
    [456, 'Linda', 'Server'],
    [789, 'Gene', 'Ketchup Refiller']
  ]
=> [[123, "Bob", "Burger flipper"], [456, "Linda", "Server"], [789, "Gene", "Ketchup Refiller"]]
> print_to_table(headings, data)
# id  | name  | role
# ------------------------------
# 123 | Bob   | Burger flipper
# 456 | Linda | Server
# 789 | Gene  | Ketchup Refiller
```
