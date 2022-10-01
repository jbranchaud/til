# Install Command Runs For Entire Workspace

When you run [`pnpm install`](https://pnpm.io/cli/install) in a monorepo, it
will run from the context of the workspace root. That means it will install
dependencies for your entire monorepo across apps and packages.

Even if you are in a subdirectory for a specific project with its own
`package.json`, running `pnpm install` will install dependencies for the entire
workspace.

If you want to install dependencies only for a specific project or a subset of
projects, you can use [the `--filter`
flag](https://pnpm.io/cli/install#--filter-package_selector).
