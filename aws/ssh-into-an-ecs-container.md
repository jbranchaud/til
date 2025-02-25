# SSH Into An ECS Container

In [Connect To Production Rails Console on AWS /
Flightcontrol](https://www.visualmode.dev/connect-to-production-rails-console-aws-flightcontrol),
I went into full detail about how to access `rails console` for a production
Rails app running in an ECS container.

A big part of that process was establishing an SSH connection to the ECS container.

To do that, I need to know my region, container ID, and task ID. I can get the
first two by listing my clusters and finding the cluster/container that houses
the Rails app.

```bash
$ aws ecs list-clusters
{
    "clusterArns": [
        "arn:aws:ecs:us-east-2:123:cluster/rails-app-abc123"
    ]
}
```

The region then is `us-east-2` and the container ID is `rails-app-abc123`.

I can use that to find the task ID:

```bash
$ aws ecs list-tasks --region us-east-2 --cluster rails-app-abc123
{
    "taskArns": [
        "arn:aws:ecs:us-east-2:123:task/rails-app-abc123/8526b3191d103bb1ff90c65a655ad004"
    ]
}
```

The task ID is the final portion of the URL:
`8526b3191d103bb1ff90c65a655ad004`.

Putting this all together I can SSH into the ECS container with a bash profile
like so:

```bash
$ aws ecs execute-command \
  --region us-east-2 \
  --cluster rails-app-abc123 \
  --container rails-app-abc123 \
  --task 8526b3191d103bb1ff90c65a655ad004 \
  --interactive \
  --command "/bin/bash"
```
