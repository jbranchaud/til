# Parse A Date From A Timestamp

If you are given a timestamp ([seconds since the Unix
epoch](https://stackoverflow.com/a/20823376/535590)) and you try to parse it
with [JavaScript's `new
Date()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/Date),
you are going to get a suprising result.

```javascript
> new Date(1618499080)
Mon Jan 19 1970 11:34:59 GMT-0600 (Central Standard Time)
```

1970? I was expected something more in the current millenia.

This is because JavaScript's `new Date()` expects a timestamp to be in milliseconds. Passing in a seconds representation of a timestamp, when it should be milliseconds, is going to result in a time pretty near the original Unix epoch.

Instead what you need to do is multiple that _seconds_ value by `1000` to get
it in terms of milliseconds.

```javascript
> new Date(1618499080 * 1000)
Thu Apr 15 2021 10:04:40 GMT-0500 (Central Daylight Time)
```

Also, notice that if I run [`+ new
Date()`](https://stackoverflow.com/a/221297/535590) without any argument, it
provides the current timestamp in milliseconds.

```javascript
> + new Date()
1618499080598
```
