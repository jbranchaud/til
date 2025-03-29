# Have Script ShellCheck Itself When Executing

The [ShellCheck](https://www.shellcheck.net/) utility can be run against bash
scripts to check if there are any warnings or errors we should fix. It works
great as long as we remember to run it.

I wondered if I could make it easier on myself by not having to remember to run
it. What if my bash script were to `shellcheck` itself?

Here is an example script where at the beginning it looks for and runs the
`shellcheck` utility against `$0` (the path of the script). This is kind of
meta. As the script is executing, it has an external program run against the
entire contents of itself. If there are any `shellcheck` issues, they get
displayed and the program exits early.

```bash
#!/bin/bash

# Exit immediately if any command fails
set -e

# Self-validation using ShellCheck
if command -v shellcheck &> /dev/null; then
    echo "Validating script with ShellCheck..."

    # $0 refers to the script itself
    if ! shellcheck "$0"; then
        echo "ShellCheck found issues in the script. Exiting."
        exit 1
    fi
    echo "Script validation passed."
else
    echo "Warning: ShellCheck not found. Skipping validation."
fi

echo "Script execution continuing..."

# shellcheck warning here
read -p "Continue with current operation? (yes/no): " CONTINUE_WITH_EXISTING
if [[ ! "$CONTINUE_WITH_EXISTING" =~ ^[Yy][Ee][Ss]$ ]]; then
    echo "Operation cancelled."
    exit 1
fi
```

This last bit of the script with the `read` command will trigger a warning from
`shellcheck`.

```bash
$ ./check.sh
Validating script with ShellCheck...

In ./check.sh line 23:
read -p "Continue with current operation? (yes/no): " CONTINUE_WITH_EXISTING
^--^ SC2162 (info): read without -r will mangle backslashes.

For more information:
  https://www.shellcheck.net/wiki/SC2162 -- read without -r will mangle backs...
ShellCheck found issues in the script. Exiting.
```
