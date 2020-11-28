# Compare The Equality Of Two Date Objects

Equality can always feel like a bit of a moving target in JavaScript. Comparing
two objects, even if visually/conceptually identical, will resolve to being not
equal.

To compare two `Date` objects, you first need to convert them to something we
can check for equality -- numbers. This can be done with `getTime()`.

```javascript
> now = Date.now()
> today1 = new Date(now)
> today2 = new Date(now)
> today1 === today2
false
> today1.getTime() === today2.getTime()
true
```

With `Date` objects, you can directly use `<`, `>`, `<=`, and `>=`.

[source](https://stackoverflow.com/questions/492994/compare-two-dates-with-javascript)
