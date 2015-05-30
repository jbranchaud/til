# Toggling The Pager In PSQL

When the pager is enabled in `psql`, commands that produce larger output
will be opened in a pager. The pager can be enabled within `psql` by running
`\pset pager on`.

If you'd like to retain the output of commands, perhaps as reference for
subsequent commands, you can turn the pager off. As you might expect, the
pager can be disabled with `\pset pager off`.

[source](http://stackoverflow.com/questions/11180179/postgresql-disable-more-output)
