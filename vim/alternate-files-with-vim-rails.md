# Alternate Files With vim-rails

If you are doing a good job of testing all the code you write in a rails
project, then most of your code files should be paired with test (or spec)
files. You can think of these as alternate files. The alternate file of
`user.rb` is `user_spec.rb` and vice versa.

The [`vim-rails`](https://github.com/tpope/vim-rails) plugin makes it easy
to jump back and forth between alternate files. Enter `:A` and you will go
to the alternate file of the current file. This makes a common navigation
path for rails projects all the more efficient.
