# Short Circuit Concurrently When Process Fails

In [Run Multiple Node Scripts
Concurrently](run-multiple-node-scripts-concurrently.md), I showed how we can
get all the essential processes of our web app running concurrently in
development using the `concurrently` package.

But what happens when there is an error and one of them exits early instead of
continuing to run?

Well, the rest of the processes under the `concurrently` umbrella continue to
run as if nothing has happened. In fact, if there is enough output, you might
even miss that that one process failed since the error gets quickly pushed off
the screen.

If we need every process running for our app to work, then it would be better
to have the whole set of concurrent processes short circuit and exit early if
one fails. We can do that by giving `concurrently` the `--kill-others-on-fail`
flag.

```json
{
  "scripts": {
    "dev": "concurrently --kill-others-on-fail \"npm:dev:*\"",
    "dev:next": "next dev",
    "dev:inngest": "pnpx inngest-cli@latest dev",
    "dev:mailhog": "mailhog",
  }
}
```

See the [Usage
section](https://github.com/open-cli-tools/concurrently?tab=readme-ov-file#usage)
of the docs for more details.
