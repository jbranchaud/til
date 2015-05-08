# Truthiness of Integer Arrays

We can consider the truthiness of `[1]` as follows:

```javascript
> [1] == true
=> true
> Boolean(true)
=> true
> Boolean([1])
=> true
```

We can consider the truthiness of `[0]` as follows:

```javascript
> [0] == false
=> true
> Boolean(false)
=> false
> Boolean([0])
=> true
```

The truthiness of `[0]` does not seem to be consistent.

See this [JavaScript Equality Table](https://dorey.github.io/JavaScript-Equality-Table/)
for more details.
