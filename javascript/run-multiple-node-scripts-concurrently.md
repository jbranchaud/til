# Run Multiple Node Scripts Concurrently

The [`concurrently` npm
package](https://github.com/open-cli-tools/concurrently) is a CLI for
concurrently running multiple commands or scripts. This is great for working in
the context of a web server development where you often need several pieces of
infrastructure running locally at once.

Assuming you have the `concurrently` package installed and there are several
dev scripts in your `package.json`, here is one way this could look:

```json
{
  "scripts": {
    "dev": "concurrently \"npm run dev:next\" \"npm run dev:inngest\" \"npm run dev:mailhog\"",
    "dev:next": "next dev",
    "dev:inngest": "pnpx inngest-cli@latest dev",
    "dev:mailhog": "mailhog",
  }
}
```

Running `npm run dev` would start a process that runs all three commands and
combines their output.

A shorthand way of writing this since these commands all have the same prefix
is:

```json
{
  "scripts": {
    "dev": "concurrently \"npm:dev:*\"",
    "dev:next": "next dev",
    "dev:inngest": "pnpx inngest-cli@latest dev",
    "dev:mailhog": "mailhog",
  }
}
```
