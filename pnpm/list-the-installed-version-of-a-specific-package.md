# List The Installed Version Of A Specific Package

`pnpm` is a Node-ecosystem package manager with first-class support for
monorepos. In a monorepo with many apps and packages that each have their own
`package.json` file, it can be tricky to know what version of a package is
installed for a specific app or package.

The `pnpm list` command can help with that. First navigate to a specific app or
package whose dependencies you want to know about. Then run a command like the
following, replacing `@trpc/next` with your package of interest.

```bash
$ pnpm list '@trpc/next'
Legend: production dependency, optional only, dev only

epic-react /Users/jbranchaud/code/clients/egghead/products/apps/epic-react

dependencies:
@trpc/next 10.7.0
```

It tells you the exact version of that dependency that is isntalled for the
current app/package.

This command can also be used with regex. Let's say you want to know about all
`next`-related dependencies. You could do the following:

```bash
$ pnpm list '*next*'
```

[source](https://pnpm.io/cli/list)
