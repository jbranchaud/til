# Compare Two Variables In A Bash Script

You can compare two variables in a bash script with an `if` block like so:

```bash
if [ "$EDITOR" = "$PREFERRED_EDITOR" ]; then
  # do something ...
fi
```

If those variables are equal, then the contents of the `if` block will be
executed.

Notice that both variables are wrapped in quotes. This is to avoid a potential
syntax error. If the quotes were excluded and one of the variables happened to
be unset, then the comparison would evaluate to:

```bash
if [ "vim" = ]; then
  # do something ...
fi
```

That would cause an error, rather than evaluating to false and moving in.
Wrapping each in quotes allows an unset variable to turn into an empty string
(`""`).
