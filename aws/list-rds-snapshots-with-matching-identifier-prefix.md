# List RDS Snapshots With Matching Identifier Prefix

I'm working on a script that manually creates a snapshot which it will then
restore to a temporary database that I can scrub and dump. The snapshots that
this script takes are _manual_ and they are named with identifiers that have a
defining prefix (`dev-snapshot-`). Besides the few snapshots created by this
script, there are tons of automated snapshots that RDS creates for
backup/recovery purposes.

I want to list any snapshots that have been created by the script. I can do
this with the `describe-db-snapshots` command and some filters.

```bash
$ aws rds describe-db-snapshots \
  --snapshot-type manual \
  --query "DBSnapshots[?starts_with(DBSnapshotIdentifier, 'dev-snapshot-')].DBSnapshotIdentifier" \
  --no-cli-pager

[
    "dev-snapshot-20250327-155355"
]
```

There are two key pieces. The `--snapshot-type manual` filter excludes all
those automated snapshots. The `--query` both filters to any snapshots whose
identifier `?starts_with` the prefix `dev-snapshot-` and then refines the
output to just the `DBSnapshotIdentifier` instead of the entire JSON object.

[source](https://docs.aws.amazon.com/cli/latest/reference/rds/describe-db-snapshots.html)
