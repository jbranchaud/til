# Random Cannot Be Seeded

In JavaScript, you can use `Math.random()` to get a *sorta* random value.

```javascript
> Math.random()
0.5130641541909426
```

Most programming languages give you a method of seeding the random number
generator for determinism. Unfortunately, JavaScript provides no way for
choosing or resetting the seed to `Math.random()`.

[source](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random)
