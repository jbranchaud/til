# Link A JavaScript Package Locally

If you are putting together a JavaScript package and you'd like to test it
out locally before putting it on NPM, use `npm link`.

First, from the directory of the package you are creating run:

```bash
$ npm link
```

This will symlink the package to the global node modules directory.

Then, from the base project directory that you want to try importing and
using the package from, run:

```bash
$ npm link name-of-package
```

This will create an additional symlink from the global node modules
directory to the `node_modules` of this target project.

You'll now have access to the project, try an `import` to get what you need
and try it out.

See `man npm-link` for more details.
