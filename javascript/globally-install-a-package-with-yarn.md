# Globally Install A Package With Yarn

I'm used to using the `-g` flag with `npm` to install packages globally.

```bash
$ npm install -g create-react-app
```

But how do I achieve the same thing with [`yarn`](https://yarnpkg.com/en/)?

By using the `global` command prefix, I can do a number of `yarn` tasks
globally, including adding a package.

```bash
$ yarn global add create-react-app
```

[source](https://yarnpkg.com/lang/en/docs/cli/global/)
