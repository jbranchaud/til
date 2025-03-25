# Output CLI Results In Different Formats

The AWS CLI can output the results of commands in three different formats.

- Text
- JSON
- Table

The _default_ output format for my AWS CLI is currently configured to `json`.

```bash
$ aws configure get output
json
```

I can either accept the default or I can override it with the `--output` flag.

```bash
$ aws rds describe-db-instances \
  --query 'DBInstances[*].Endpoint' \
  --no-cli-pager
[
    {
        "Address": "fc-database-abcefg-ab1c23de.asdfgh4zxcvb.us-east-2.rds.amazonaws.com",
        "Port": 5432,
        "HostedZoneId": "A1BCDE2FG345H6"
    }
]

$ aws rds describe-db-instances \
  --query 'DBInstances[*].Endpoint' \
  --no-cli-pager \
  --output table
----------------------------------------------------------------------------------------------------
|                                        DescribeDBInstances                                       |
+-----------------------------------------------------------------------+-----------------+--------+
|                                Address                                |  HostedZoneId   | Port   |
+-----------------------------------------------------------------------+-----------------+--------+
|  fc-database-abcefg-ab1c23de.asdfgh4zxcvb.us-east-2.rds.amazonaws.com |  A1BCDE2FG345H6 |  5432  |
+-----------------------------------------------------------------------+-----------------+--------+

$ aws rds describe-db-instances \
  --query 'DBInstances[*].Endpoint' \
  --no-cli-pager \
  --output text
fc-database-abcefg-ab1c23de.asdfgh4zxcvb.us-east-2.rds.amazonaws.com    A1BCDE2FG345H6  5432
```

[source](https://docs.aws.amazon.com/cli/v1/userguide/cli-usage-output-format.html)
