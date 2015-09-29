# Caching Credentials

When public key authentication isn't an option, you may find yourself typing
your password over and over when pushing to and pulling from a remote git
repository. This can get tedious. You can get around it by configuring git
to cache your credentials. Add the following lines to the `.git/config` file
of the particular project.

```
[credential]
    helper = cache --timeout=300
```

This will tell git to cache your credentials for 5 minutes. Use a much
larger number of seconds (e.g. 604800) to cache for longer.

Alternatively, you can execute the command from the command line like so:

```bash
$ git config credential.helper 'cache --timeout=300'
```

[source](http://git-scm.com/docs/git-credential-cache)
