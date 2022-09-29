# Execute A Command From The Workspace Root

[`pnpm`](https://pnpm.io/) is designed to work with monorepos. In a monorepo
project you'll have a root `package.json` (in the top-level directory of the
repository) as well as individual `package.json` files per app and package. If
you're working from within the directory of one of your apps and you invoke a
command, `pnpm` should execute that command for this app. The `pnpm` CLI does
give you control to execute the command from the workspace root instead if
you'd like.

A likely setup is that both your root `package.json` and your individual app
`package.json` files have a `build` command.

Invoking the build command from `apps/my-app`:

```bash
pnpm build
```

will run the `my-app` build command, as specified in its `package.json`.

You could instead throw in [the `--workspace-root`
flag](https://pnpm.io/pnpm-cli#-w---workspace-root).

```bash
pnpm --workspace-root build
```

This will ignore whatever subdirectory you are in and invoke the `build`
command defined in your top-level `package.json` file.
