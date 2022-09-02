# Create Union Type From Constants

I like to capture what I call _magic strings_ in constants (variables, really)
so that I can use them and reuse them with minimal maintenance. Minimal
maintenance because if something about the value of the string changes, I only
need to make that update in a single place.

I want to extend this reuse to my type system as well.

Let's say I have some constants defined like so:

```typescript
const UPGRADE = "upgrade";
const DOWNGRADE = "downgrade";
```

I can create a union type from those values using the [`typeof`
operator](https://www.typescriptlang.org/docs/handbook/2/typeof-types.html).

```
type IntervalChange = typeof UPGRADE | typeof DOWNGRADE;
//=> type IntervalChange = 'upgrade' | 'downgrade'
```

I can then use both the constants and the type throughout my code with only one
place to update.

```typescript
function checkForUpgrade(interval: string): IntervalChange {
  // some logic
  const result = ...;

  return result ? UPGRADE : DOWNGRADE;
}
```

[source](https://twitter.com/jbrancha/status/1565770454052249601?s=20&t=4seYY0mzoTFeDCiFwRB91g)
