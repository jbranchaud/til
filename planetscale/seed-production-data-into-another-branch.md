# Seed Production Data Into Another Branch

When you [create a Planetscale
branch](https://planetscale.com/docs/reference/branch) off `main`, it will only
copy over the schema. No data will be copied over to that new branch.

You can copy data over from the initial branch (`main`) in two steps from the
CLI. First, create a dump of the branch. Then restore the dump into your new
branch.

```bash
$ pscale database dump database-name main --output ./dump
```

That creates SQL files locally in the `dump` folder with both schema and data
statements.

That folder of SQL files can then be restored into one of your branches.

```bash
$ pscale database restore-dump database-name branch-name --dir ./dump --overwrite-tables
```

The `--overwrite-tables` flag is needed because your branch's existing schema
will conflict with the `create` schema statements in the SQL files.

You can `pscale shell` into that branch and run a `select ...` statement to
check out the data.
