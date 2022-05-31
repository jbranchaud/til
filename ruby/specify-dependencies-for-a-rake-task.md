# Specify Dependencies For A Rake Task

Let's say you have rake task that performs some important business task. For
instance, a book seller might want a task that can tell them the top selling
books from a CSV report.

```ruby
task :top_selling_books do
  # read in CSV and process for top selling books
end
```

This works great if the CSV file already exists on the machine from which this
task is run. What if it isn't tho?

The CSV is a prerequesite for this task. We explicitly define it as a
prerequisite using the task dependency syntax.

```ruby
task :download_latest_book_sales_csv do
  # saves a CSV of book sales
end

task top_selling_books: :download_latest_book_sales_csv do
  # read in CSV and process for top selling books
end
```

We can even define multiple task dependencies with an array.

```ruby
task top_selling_books: [:download_latest_book_sales_csv, :clean_csv] do
  # read in CSV and process for top selling books
end
```

[source](https://subscription.packtpub.com/book/hardware_and_creative/9781783280773/1/ch01lvl1sec13/task-dependencies-prerequisites)
