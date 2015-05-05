# Create A New File In A New Directory

From within a vim session, if you create a buffer for a new file in a
directory that doesn't exist. For instance, let's say that `/features`
doesn't exist and the new file is `my_latest_feature_spec.rb`:

```
:e spec/features/my_latest_feature_spec.rb
```

Vim's command line will inform you that this is a buffer for a `[New
DIRECTORY]`. If you then make some changes and subsequently try to save the
file, Vim will present you with:

```
"spec/features/my_latest_feature_spec.rb" E212: Can't open file for writing
```

This is because the containing directory doesn't exist. You can quickly
create that directory with a combination of Vim filename shorthands and
shelling out to the `mkdir` command.

```
:!mkdir -p %:h
```

The `%` is shorthand for the qualified path of the current file. The `:h` is
a filename modifier that returns the *head of the filename*, that is, it
resolves to the path with everything except the name of the file.

Thus, this command is essentially resolving to:

```
:!mkdir -p spec/features/
```

Vim will shell out with this command making directories for all non-existent
directories in the given path. Now you can happily save your new file.
