# Globally Install Specific Version Of PNPM

There are several ways to install [`pnpm`](https://pnpm.io/). I prefer using
`npm` because I already have it installed and it fits in with all the other
global packages I have installed.

```bash
npm install --location=global pnpm@7.13.4
```

The `--location` flag tells `npm` to install it as a `global` package, rather
than as part of my current project.

The `@7.13.4` tacked onto the end of the `pnpm` package name is how I specify
the version of the package I am interested in.
