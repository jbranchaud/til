# Load Env Vars In Bash Script

I have a file with environment variables in my current directory named
something like `.env.local`. I want to load those variabls into my environment
in the context of a bash script. That can be accomplished by exporting them at
the beginning of the script with a line like this:

```bash
export $(egrep -v '^#' .env.local | xargs)
```

This uses `egrep` with the `-v '^#'` inverted match pattern to excluded any
comment lines. Then `xargs` is going to remove any excess whitespace and echo
the sequence env var entries. All of which will be the argument passed to
`export` which adds them to the environment.

Here is an example of using it in a script that uses one of those secret env
var values as a bearer token in a cURL request.

```bash
#!/bin/bash

# Load environment variables from .env.local file
export $(egrep -v '^#' .env.local | xargs)

# Now you can use the environment variable in your CURL command
curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_ACCESS_TOKEN"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/jbranchaud/github-actions-experiment/actions/workflows/playwright.yml/dispatches \
  -d '{"ref":"main"}'
```
