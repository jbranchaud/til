# Run Rails Console With Remote Dokku App

Whenever I want to `rails console` into the _staging_ server of an app I'm
working on, I first have to `ssh` into server and then I have to come up with
the [`dokku`](https://dokku.com/) command to run `rails console` against the app
on that server.

```bash
local> ssh app-staging # app-staging is an SSH alias
staging> dokku run my-app rails console
```

I figured out how to reduce the friction of this by collapsing it into a single
command that I can run locally. I can remotely run the `dokku` command with
`ssh` using an interactive session (`-t`).

```bash
local> ssh -t app-staging dokku run my-app rails console
```

That will open up a `rails console` session directly in the current shell
session via a remote SSH connection. The `-t` flag is important because that
makes the session interactive so that I can interact with the REPL.

I've even packaged this up into a bin script (`bin/staging-console`) with a
couple checks to enhance the DX. I won't put the whole thing here, but the gist
of it is:

```bash
#!/usr/bin/env bash

set -e

if [ -z "$DOKKU_STAGING_SSH_ALIAS" ]; then
  echo "Error: DOKKU_STAGING_SSH_ALIAS environment variable is not set."
  echo ""
  # echo more help details here ...
  exit 1
fi

# Check if SSH alias exists
# ...

# Check if we can reach the server
# ...

# Run the console
ssh -t "$DOKKU_STAGING_SSH_ALIAS" dokku run my-app rails console "$@"
```
