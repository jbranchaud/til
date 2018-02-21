# List Top-Level NPM Dependencies

The `npm ls` command can be used to list all dependencies for a project.
This will, however, produce an exhaustive list of all dependencies including
dependencies of dependencies. A list this large probably isn't going to be
of much use.

The `--depth` flag allows you to restrict the depth of the dependency tree
that is generated.

```bash
$ npm ls --depth=0
```

This will produce a list of only the top-level dependencies.

See `man npm-ls` for more details.
