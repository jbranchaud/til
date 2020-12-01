# Deploy An App Without Pushing An Empty Commit

The [Vercel CLI](https://vercel.com/docs/cli) allows you to make updated
deployments of an app right from the command line.

Many providers require you to push a new commit to the main branch to trigger a
deployment. If there are changes, you can trigger a deployment by pushing
these. If there aren't changes, but you want to re-deploy what is already
there, then you have to create an empty commit and push that.

With the [Vercel CLI](https://vercel.com/docs/platform/deployments#vercel-cli),
you can re-deploy your app without pushing commits. You do this by including
the `--force` flag.

To re-deploy the preview environment:

```bash
$ vercel --force
```

To re-deploy the production environment:

```bash
$ vercel --prod --force
```
