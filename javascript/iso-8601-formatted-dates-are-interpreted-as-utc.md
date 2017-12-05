# ISO-8601 Formatted Dates Are Interpreted As UTC

Using `new Date()` or `Date.parse()` with a string that represents a date is
a great way to create a `Date` object for a specified date. A variety of
formats are accepted by these methods.

But, caution!

There are subtle differences in how those dates will be interpreted. Given
any old string that reasonably represents a date, the date will be
interpreted using the local time zone, in my case `CST`.

```javascript
> new Date('2017-12-4')
Mon Dec 04 2017 00:00:00 GMT-0600 (CST)
```

However, as soon as we use an ISO-8601 compliant date format, ECMAScript 5
specifies that the date ought to be interpreted using the UTC time zone. As
you can see, the results are drastic enough to affect what day it comes out
to.

```javascript
> new Date('2017-12-04')
Sun Dec 03 2017 18:00:00 GMT-0600 (CST)
```

[Source](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/parse#ECMAScript_5_ISO-8601_format_support)
