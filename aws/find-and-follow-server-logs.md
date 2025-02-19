# Find And Follow Server Logs

Let's say you are authenticated with the AWS CLI and have the appropriate
CloudWatch permissions. You have a few services running in production with
associated logs. One of those is a Rails server.

We want to run `aws logs tail`, but first we check how that command works.

```bash
$ aws logs tail help
```

We see a bunch of options, but the only required one is `group_name` ("The name
of the CloudWatch Logs group."). We may also notice the `--follow` flag which
we'll want to use as well to keep incoming logs flowing.

We need to determine the log group name for the Rails server. We can do that
from the CLI as well (no need to dig into the web UI).

```bash
$ aws logs describe-log-groups

{
    "logGroups": [
        {
            "logGroupName": "/aws/codebuild/fc-rails-app-abcefg-123456",
            "creationTime": 1739476650823,
            "metricFilterCount": 0,
            "arn": "arn:aws:logs:us-east-2:123456789:log-group:/aws/codebuild/fc-rails-app-abcefg-123456:*",
            "storedBytes": 65617,
            "logGroupClass": "STANDARD",
            "logGroupArn": "arn:aws:logs:us-east-2:123456789:log-group:/aws/codebuild/fc-rails-app-abcefg-123456"
        },
        ...
    ]
}
```

Because the group name is descriptive enough, we can find the log group we are
interested in: `/aws/codebuild/fc-rails-app-abcefg-123456`.

Now we know what we want to `tail`.

```bash
$ aws logs tail /aws/codebuild/fc-rails-app-abcefg-123456 --follow
```
