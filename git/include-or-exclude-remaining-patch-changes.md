# Include Or Exclude Remaining Patch Changes

I often use `git add --patch` as a way of interactively staging changes for a
commit. Git walks me through each individual chunk of changes—which it calls
_hunks_—so that I can include it or exclude it.

Sometimes, like when I'm working with a `yarn.lock` file, there are a ton of
computer-generated changes to a file that I don't want to individually confirm.
One of the options while interactively staging is to hit `a` which will stage the current hunk and all later hunks for the current file.

A complementary scenario arises at times when working with a Rails `schema.rb`
file. There are a bunch of Postgres client-specific changes that I don't want
to commit. Once I get to the `schema.rb` file, I can hit `d` to _not_ stage
this or all remaining hunks in the current file.

```
a - stage this hunk and all later hunks in the file
d - do not stage this hunk or any of the later hunks in the file
```

This saves me from hitting `y` a dozen times to accept changes or hitting `n` a
dozen times to decline changes.

See `man git-add` and look for the _Interactive mode_ section for more details.
