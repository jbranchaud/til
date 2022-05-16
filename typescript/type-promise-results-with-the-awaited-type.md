# Type Promise Results With the Awaited Type

[TypeScript 4.5 introduces the `Awaited`
type](https://www.typescriptlang.org/docs/handbook/release-notes/typescript-4-5.html#the-awaited-type-and-promise-improvements)
which can be used to model the resulting type of Promise and async/await code.

The release notes give a couple helpful examples which I'll share:

```typescript
// A = string
type A = Awaited<Promise<string>>;

// B = number
type B = Awaited<Promise<Promise<number>>>;

// C = boolean | number
type C = Awaited<boolean | Promise<number>>;
```

This can be taken a step further with an existing typed function and the help
of the [`ReturnType`
type](https://www.typescriptlang.org/docs/handbook/utility-types.html#returntypetype).

```typescript
// getPosts' return type Promise<Array<Post>>
import {getPosts} from './getPost'

// type: { posts: Array<Post> }
type LoaderData = {
  posts: Awaited<ReturnType<typeof getPosts>>;
}
```

It gets the full `typeof` of `getPosts`, whittles that down to the
`ReturnType`, and then `Awaited` unwraps the promise. I learned this from the
[Remix blog
tutorial](https://remix.run/docs/en/v1/tutorials/blog#a-little-refactoring).
