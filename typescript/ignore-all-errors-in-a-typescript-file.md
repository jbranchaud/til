# Ignore All Errors In A TypeScript File

As of TypeScript 3.7, we can mark an entire TypeScript file to be ignored by
the TypeScript compiler when it is doing static type checking.

We can do this by adding the `@ts-nocheck` directive at the top of the file:

```typescript
// @ts-nocheck

type User = {
  id: string;
  name: string;
  email: string;
}

const user: User = {
  id: 123,
  name: "Liz Lemon",
  email: "liz.lemon@nbc.com",
};
```

Notice that `id` is typed as a `string`, but we are using a `number` with `id`
for `user`. That is a type error. But with the `@ts-nocheck` directive at the
top, the type checker doesn't run on the file and we see no type errors.

I'd generally suggest to avoid doing this. It can hide real type errors that
you should be addressing. That said, in special circumstances, you may need it,
even if just temporarily, like if an imported package doesn't have types. Here
is an example of that in [uploadthing's
`rehype.js`](https://github.com/pingdotgg/uploadthing/blob/d98fbefedddf64d183cc5a00b3fd707e8d8f2f6c/docs/src/mdx/rehype.js#L1)
which is missing types from `mdx-annotations`.

[source](https://www.typescriptlang.org/docs/handbook/release-notes/typescript-3-7.html#-ts-nocheck-in-typescript-files)
