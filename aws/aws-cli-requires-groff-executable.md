# AWS CLI Requires Groff Executable

I have the AWS CLI installed on this machine, but when I went to run certain
commands like `aws logs tail my_log_group` or even `aws logs tail help`, I'd
get the following error:

```
$ aws logs tail help

Could not find executable named 'groff'
```

This may only be an issue on MacOS Ventura for older versions of the CLI, per
[this PR](https://github.com/aws/aws-cli/pull/7413):

> The CLI's help commands are currently broken on macOS Ventura because Ventura has replaced groff with mandoc. This PR fixes the issue by falling back on mandoc if groff doesn't exist in the path.

There are two ways of dealing with this. One would be to install the missing
dependency, [`groff`](https://www.gnu.org/software/groff/):

```bash
$ brew install groff
```

The other is to update the AWS CLI to one that falls back to `mandoc`.
Depending on how you originally installed the AWS CLI, you can either [follow
their official install/upgrade
instructions](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html),
`pip install --upgrade awscli`, or upgrade view homebrew (`brew upgrade
awscli`).
