# List Filenames Without The Diffs

The `git show` command will list all changes for a given reference
including the diffs. With diffs included, this can get rather verbose at
times. If you just want to see the list of files involved (excluding the
diffs), you can use the `--name-only` flag. For instance,

```
$ git show HEAD --name-only
commit c563bafb511bb984c4466763db7e8937e7c3a509
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Sat May 16 20:56:07 2015 -0500

    This is my sweet commit message

app/models/user.rb
README.md
spec/factories/user.rb
```
