# Whitespace Warnings

You can configure git to warn you about whitespace issues in a file when you
diff it. This is handled by the `core.whitespace` configuration. Add the
following to your `.gitconfig` file:

```
[core]
      whitespace = warn
```

By default, git will warn you of trailing whitespace at the end of a line as
well as blank lines at the end of a file.
