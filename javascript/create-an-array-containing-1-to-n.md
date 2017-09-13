# Create An Array Containing 1 To N

Some languages, such as Ruby, have a built in range constraint that makes it
easy to construct an array of values from 1 to N. JavaScript is not one of
those languages. Nevertheless, if you don't mind the aesthetics, you can get
away with something like this:

```javascript
> Array.apply(null, {length: 10}).map(Number.call, Number);
=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```

That gives us `0` through `9`. To get `1` through `10`, we can tweak it
slightly:

```javascript
> Array.apply(null, {length: 10}).map(Number.call, n => Number(n) + 1);
=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

To generalize this, we can replace `10` with `N` and then just expect that
`N` will be defined somewhere:

```javascript
> var N = 10;
=> undefined
> Array.apply(null, {length: N}).map(Number.call, n => Number(n) + 1);
=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

[Source](http://stackoverflow.com/a/20066663/535590) 
