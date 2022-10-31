# Create A Non-Empty Array Type

An array type (e.g. `Array<string>`) by default will allow an empty array. We
can define a custom array type that does static type checking to ensure arrays
aren't declared as empty.

To do this, we specify the array type has at least one item in addition to the
_spread_ of the rest of the array.

```typescript
type NonEmptyArray<T> = [T, ...T[]];
```

If we declare a `NonEmptyArray` with no items:

```typescript
const statuses: NonEmptyArray<string> = [];
```

We'll get the following type error:

```
Type '[]' is not assignable to type 'NonEmptyArray<string>'.
  Source has 0 element(s) but target requires 1.
```

Whereas as soon as we add at least one item, the type error goes away.

```typescript
const statuses: NonEmptyArray<string> = ['active'];
```

Here is a [TS Playground example of this type](https://www.typescriptlang.org/play?#code/C4TwDgpgBAcg9gOwKIFsygIICcsEMQA8AKgHxQC8UA2kQDRQB0TRVAuqwNwBQXAxogGdgUCGlABlYLmABXARAEAuWIlToQ2PISFYAlggDmZSm259BwodLkLl8ZGI058BHfqMVqAcly9gugDcIL04gA).

[source](https://twitter.com/he_zhenghao/status/1583557892480778240)
