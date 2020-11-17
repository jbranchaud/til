# Share Development Environment Variables Via CLI

[Vercel](https://vercel.com/)'s web UI as well as it's CLI make it easy to
store and manage environment variables for your different environments. It is
also safe because it encrypts them.

You and your team can safely access the environment variables for the
development environment with the following CLI command.

```
$ vercel env pull
```

Assuming you have already connected with and authenticated yourself for the
current project, this command will fetch the env vars and write them to the
`.env` file.

If the env vars are ever updated, you can run the command again and it will
rewrite the local file.
