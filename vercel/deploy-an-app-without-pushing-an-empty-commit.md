# Deploy An App Without Pushing An Empty Commit

The [Vercel CLI](https://vercel.com/docs/cli) allows you to make updated
deployments of an app right from the command line. Many providers require you
to push a new commit to the main branch to trigger a deployment. If there are
changes, you can trigger a deployment by pushing these. If there aren't
changes, but you want to re-deploy what is already there, then you have to
create an empty commit and push that.

With the [Vercel CLI](https://vercel.com/docs/platform/deployments#vercel-cli),
you can deploy and re-deploy the app without pushing commits.

To trigger a preview deployment:

```bash
$ vercel
```

To trigger a production deployment:

```bash
$ vercel --prod
```
