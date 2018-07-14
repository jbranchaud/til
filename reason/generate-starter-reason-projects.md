# Generate Starter Reason Projects

With the latest `bs-platform` installed, you should have access to the `bsb`
command which contains a number of options -- including `-themes`.

```bash
$ bsb -themes
Available themes:
basic
basic-reason
generator
minimal
node
react
```

This is a list of themes (read: templates) that can be used to generate a
starter project.

For example, if you'd like a basic project structure geared toward writing
Reason, run the following:

```bash
$ bsb -init my-project -theme basic-reason
```

Or if you'd like to get started with
[`reason-react`](https://reasonml.github.io/reason-react/), give this a try:

```bash
$ bsb -init my-reason-react-project -theme react
```

[source](https://bucklescript.github.io/docs/en/new-project.html)
