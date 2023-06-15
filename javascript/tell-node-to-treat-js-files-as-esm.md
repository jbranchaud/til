# Tell Node To Treat JS Files As ESM

By default, Node will treat all `.js` files as CommonJS. That means you'll need
to use the CommonJS export and require syntax to share code between files. If
you'd instead like to opt-in to ESM (ECMAScript Modules), you'll need to update
your `package.json`.

Add the following line:

```json
"type": "module",
```

This will tell node that instead of CJS, it should treat all `.js` files as
ESM. This means that ESM-based `export` and `import` syntax will work.

This also means you don't need to be defining your files with the `.mjs`
extension.

For more extensive reading on this, see:

- [ECMAScript Modules in Node.js](https://www.typescriptlang.org/docs/handbook/esm-node.html)
- [Getting Started with (and Surviving) Node.js ESM](https://formidable.com/blog/2021/node-esm-and-exports/)
- [`.mts` is a cool file extension (TypeScript ES modules)](https://mtsknn.fi/blog/mts-file-extension/)
