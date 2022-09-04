# Type Narrowing With Const VS Let Strings

[TypeScript's `typeof`
operator](https://www.typescriptlang.org/docs/handbook/2/typeof-types.html) can
be used to capture the type of a variable.

For instance, we can use it with a string variable like so:

```typescript
let status = 'active';

type Status = typeof status;
//=> type Status = string;
```

The result is a type `Status` defined as a `string`.

What if we were to do the same with a string variable defined with `const`
(instead of `let`)?

```typescript
const status = 'active';

type Status = typeof status;
//=> type Status = 'active';
```

We get a different result. A much more specific result. The `Status` type
definition in this case isn't just any `string`. TypeScript knows specifically
that it is the string `'active'`.

This is _Type Narrowing_ at work. With our `let` string, which can be redefined
at anytime, the most TypeScript can tell us about it is that it is a `string`.
Our `const` string, on the other hand, is frozen as `'active'`, so TypeScript
can narrow the type from `string` to the string `'active'`.

That can be handy for [defining a union type from existing `const`
values](https://twitter.com/jbrancha/status/1565770454052249601).

[source](https://twitter.com/jbrancha/status/1565752445187358721)
