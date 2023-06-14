# Get The Time Components Of A Date

A `Date` object in JavaScript has several functions available to it for getting
at the time components of that date.

```javascript
> const now = new Date()
undefined
> now
2023-06-14T17:44:06.425Z
> now.getMinutes()
44
> now.getSeconds()
6
> now.getHours()
12
```

For a given `Date` object, you can access the hours with
[`getHours()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/getHours),
the minutes with
[`getMinutes()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/getMinutes),
and the seconds with
[`getSeconds()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/getSeconds).

To round things out, there is also
[`getMilliseconds()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/getMilliseconds)
and
[`getTimezoneOffset()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/getTimezoneOffset).
