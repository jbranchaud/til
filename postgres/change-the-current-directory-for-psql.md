# Change The Current Directory For psql

When you start a `psql` session, your current directory is what `psql` will
use as its current directory. This is important for meta-commands that use
relative paths based on the current directory -- for instance, the `\i`
meta-command for importing files.

You can change the current directory within a `psql` session using the `\cd`
meta-command.

If my current directory is `home` and there is a `sql` directory in `home,
these commands will do the following:

```sql
\! pwd
-- /home
\cd sql
\! pwd
-- /home/sql
```

The `\cd` meta-command even supports tab completion relative to the current
directory.

You can also change to your home directory using just `\cd`.
