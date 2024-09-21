# Generate A Model

The `rails` CLI comes with a variety of generators. Perhaps the mostly common
one to use is the _model_ generator.

The model generator will create a migration and a model file for the entity
that you name. In the following example `Book` will result in a
`app/models/book.rb` file as well as a migration file for a `books` table.
These generators know the singular and plural conventions.

At the end of the command is a series of field definitions containing the field
_name_ and field _type_. These are used in the migration file for defining
columns on the new table.

```bash
❯ bin/rails generate model Book title:string publication_date:date author:string
      invoke  active_record
      create    db/migrate/20240920223447_create_books.rb
      create    app/models/book.rb
      invoke    rspec
      create      spec/models/book_spec.rb
```

You may also notice that an `rspec` action was invoked as part of this
generator. That is because I have the `rspec-rails` gem in my project. That gem
hooks into the model generator so that a model spec also gets generated. Handy!
