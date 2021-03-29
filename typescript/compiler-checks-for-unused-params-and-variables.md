# Compiler Checks For Unused Params And Variables

There are a number of linter-esque checks that you can tell the TypeScript
compiler to make when it is checking your code. There are two that prevent
values from going unused: one for parameters and the other for variables.

The [`noUnusedLocals`](https://www.typescriptlang.org/tsconfig#noUnusedLocals)
config, which defaults to `false`, can be set to `true`. This will cause the
compiler to fail if a locally declared variable goes unused.

```typescript
function printItem(item: any, index: number) {
  const indexedItem = `${index}: ${item}`;
  //    ^^^ 'indexedItem' is declared but its value is never read.

  console.log(item);
}
```

The
[`noUnusedParameters`](https://www.typescriptlang.org/tsconfig#noUnusedParameters)
config, which also defaults to `false`, can be set to `true`. This will cause
the compiler to fail if a function param goes unused.

Fixing the previous error could then result in this one.

```typescript
function printItem(item: any, index: number) {
  //                          ^^^
  // 'index' is declared but its value is never read.

  console.log(item);
}
```

Here is what the `tsconfig.json` would look like:

```json
{
  "compilerOptions": {
    "noUnusedLocals": true,
    "noUnusedParameters": true,
  }
}
```
