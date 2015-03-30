# Checkout Old Version Of A File

When you want to return to a past version of a file, you can reset to a past
commit. When you don't want to abandon a bunch of other changes, this isn't
going to cut it. Another option is to just checkout the particular file as
it was at the time of a past commit.

If the sha of that past commit is `72f2675` and the file's name is
`some_file.rb`, then just use checkout like so:

```
$ git checkout 72f2675 some_file.rb
```
