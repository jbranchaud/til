# Generate and Edit Rails Migration

Creating a new Rails migration has always involved two distinct steps for
me. The first is to run `rails g migration CreateSomeTable` to create a
migration file. The second is to copy and paste the migration's filename
after `vi` to actually start editing it.

[Rails.vim](https://github.com/tpope/vim-rails) collapses these steps into
one:

```
:Rgenerate migration CreateSomeTable
```

[source](http://stackoverflow.com/questions/7857177/with-vim-rails-can-you-create-a-new-migration-file-and-open-it-in-one-go)
