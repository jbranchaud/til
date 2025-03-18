# Turn Off Output Pager For A Command

It is not uncommon for an AWS CLI command to return a ton of output. When that
happens, it is nice that the results end up in pager program (like `less`)
where you can search and review them, copy a value of interest, and then exit.
The pager prevents that wall of output from cluttering your terminal history.

However, sometimes I am running a command that I know is going to return a
small result. I'd rather have the results go to stdout where I can see them in
the terminal history rather than to an ephemeral pager.

For that situation I can tack on the `--no-cli-pager` flag.

```bash
$ aws rds describe-db-instances \
  --query 'DBInstances[*].EngineVersion' \
  --output json \
  --no-cli-pager

[
    "13.15",
    "16.8"
]
```

Here I've asked the AWS CLI to tell me the engine versions of all my RDS
Postgres databases. Because I know the results are only going to include a
couple results for my couple of DBs, I'd like to skip the pager —
`--no-cli-pager`.

Though I think it is better to do this on a case by case basis, it is also
possible to turn off the pager via the CLI configuration file.

```bash
$ aws configure set cli_pager ""
```

[source](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-pagination.html#cli-usage-pagination-clientside)
