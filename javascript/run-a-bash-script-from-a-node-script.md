# Run A Bash Script From A Node Script

A node script in `package.json` can reference and run any command or executable
script available on our system. This is why we're able to have node scripts
that do things like run a linter or start a web server.

We can take this a step further by defining our own scripts to enhance our
development and CI environments.

For instance, let's say we have the following bash script (`check-stripe`) in
our project's `scripts` directory for checking that we are connected to the
right Stripe account.

```bash
#!/bin/bash

# Expected stripe display name
EXPECTED_STRING="My Online Product"

# Currently connected stripe display name
COMMAND_OUTPUT=$(
	stripe config --list | grep '^display_name' | awk -F'=' '{print $2}' | xargs
)

# Compare the expected string with the command output
if [ "$EXPECTED_STRING" = "$COMMAND_OUTPUT" ]; then
    exit 0
else
    echo "Mismatched Stripe accounts, expected $EXPECTED_STRING, got $COMMAND_OUTPUT."
    exit 1
fi
```

This script exits with either a successful (`0`) or failed (`1`) status. We can
use this in our node script to guard another command from getting run.

```json
{
  "scripts": {
    "dev:stripe": "./scripts/check-stripe && stripe listen ..."
  }
}
```
