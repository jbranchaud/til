# Find Where Yarn Is Installing Binaries

When you run a command like:

```bash
$ yarn global add create-react-app
```

[Yarn](https://yarnpkg.com/lang/en/) is going to install any needed
dependencies including any binaries. So, where is Yarn putting these binaries?

Let's ask:

```bash
$ yarn global bin
/Users/jbranchaud/.asdf/installs/nodejs/10.15.3/.npm/bin
```

This is where it is located on my machine. You'll want to run it on your own
machine because the exact location will depend on the specifics of your
installation.

See [the docs](https://yarnpkg.com/lang/en/docs/cli/global/) for more details.
