# Pin Specific pnpm Version For Builds

Vercel recognizes when [a project contain a `pnpm-lock.yaml`
file](https://vercel.com/changelog/projects-using-pnpm-can-now-be-deployed-with-zero-configuration)
and will automatically use [`pnpm`](https://pnpm.io/) for builds of that
project.

It looks for [the `lockfileVersion` in `pnpm-lock.yaml` to determine what major
version of `pnpm` to
install](https://vercel.com/docs/concepts/deployments/configure-a-build#install-command).
If the `lockfileVersion` is `5.4`, then it will use the latest pnpm v7.
Otherwise it will fallback to the latest pnpm v6.

That's the extent of the control you have over the `pnpm` version. That is,
unless you are to use [this experimental corepack
feature](https://vercel.com/docs/concepts/deployments/configure-a-build#corepack).
Set the `ENABLE_EXPERIMENTAL_COREPACK` environment variable to `1` in your
project's _Environment Variables_ under _Settings_.

Then specify the `pnpm` version with the `packageManager` key in your
`package.json`.

```json
{
  "packageManager": "pnpm@7.13.2"
}
```

Even though the current latest is `7.13.5`, Vercel will see the Corepack
environment variables and the `packageManager` version and use `7.13.2`
instead.

See [this PR](https://github.com/skillrecordings/products/pull/535) and [this
issue](https://github.com/prisma/prisma/issues/12921#issuecomment-1284425847)
for more details.
