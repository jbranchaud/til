# Use Specific AWS Profile With CLI

I have multiple AWS profiles authenticated with the AWS CLI. For some projects
I need to use the `default` one and for others I need to use the other.

First, I can list the available profiles like so:

```bash
$ aws configure list-profiles
default
dev-my-app
```

For one-off commands I can specify the profile for any AWS CLI command using
the `--profile` flag.

```bash
$ aws ecs list-clusters --profile josh-visualmode
```

However, I don't want to have to specify that flag every time when I'm working
on a specific project. Instead I can specify the profile with an environment
variable. The [`direnv`](https://direnv.net/) tool is a great way to do this on
a per-project / per-directory basis.

I can create or update the `.envrc` file (assuming I have `direnv` installed)
adding the following line (and re-allowing the changed file):

```
# .envrc
export AWS_PROFILE=dev-my-app
```

Now, any AWS command I issue from that directory or its subdirectories will use
that profile by default.

[source](https://docs.aws.amazon.com/cli/v1/userguide/cli-configure-files.html#cli-configure-files-using-profiles)
