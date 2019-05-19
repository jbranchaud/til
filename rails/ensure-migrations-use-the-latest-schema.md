# Ensure Migrations Use The Latest Schema

Real-world migrations in Rails apps can sometimes involve both schema changes
and data changes. For instance, if you are moving a column from one table to
another, you'll need to add a new column, move some data, and then delete the
old column.

```ruby
# Assume the following are defined:
# GenericAuthor for table 'authors'
# GenericBook for table 'books'

def up
  add_column :books, :genre, :string

  GenericAuthor.find_each do |author|
    book = GenericBook.find_by(author_id: author.id)
    book.update!(genre: author.genre)
  end

  remove_column :authors, :genre
end
```

This migration looks straightforward, but you may find that no data actually
gets transferred to the `genre` column on `books`. This is because as a
performance optimization, Rails has cached the scema. Thus an `ActiveRecord`
modification like `book.update!` will be working off a version of the schema
that doesn't include `genre` as a column.

We can ensure `ActiveRecord` is using the latest column informtion for the
`books` table by calling
[`reset_column_information`](https://api.rubyonrails.org/classes/ActiveRecord/ModelSchema/ClassMethods.html#method-i-reset_column_information).

```ruby
def up
  add_column :books, :genre, :string

  GenericBook.reset_column_information

  GenericAuthor.find_each do |author|
    book = GenericBook.find_by(author_id: author.id)
    book.update!(genre: author.genre)
  end

  remove_column :authors, :genre
end
```

Now the update will work and `genre` will be set on `books`.
