# Generate Random Integers

JavaScript's `Math` module has a built-in `random` function.

```javascript
> Math.random();
0.4663311937101857
```

It can be used to generate random floats between 0 and 1.

If you want integers, though, you're going to have to build your own function.

```javascript
function getRandomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

> getRandomInt(10);
1
> getRandomInt(10);
7
> getRandomInt(10);
2
```

This function allows you to randomly generate numbers between `0` (inclusive)
and `max`, a number you specify (exclusive).

[source](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random)
