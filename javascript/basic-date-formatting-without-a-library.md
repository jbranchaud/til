# Basic Date Formatting Without A Library

JavaScript, on modern browsers, has an Internationalization API that, among
other things, provides some date formatting utilities. You can just start using
it, no need to import some massive date formatting library.

Here is a `Date` object:

```javascript
> const now = new Date();
> now
Tue Nov 19 2019 16:23:43 GMT-0600 (Central Standard Time)
```

The default formatting with this API is a good start:

```javascript
> Intl.DateTimeFormat('en-US').format(now)
"11/19/2019"
```

There are also a number of options for more advanced formatting. Here is the
`dateStyle` option with the four possible option values:

```javascript
> Intl.DateTimeFormat('en-US', { dateStyle: "full" }).format(now)
"Tuesday, November 19, 2019"
> Intl.DateTimeFormat('en-US', { dateStyle: "long" }).format(now)
"November 19, 2019"
> Intl.DateTimeFormat('en-US', { dateStyle: "medium" }).format(now)
"Nov 19, 2019"
> Intl.DateTimeFormat('en-US', { dateStyle: "short" }).format(now)
"11/19/19"
```

There is a lot more to this API including localization and custom formatting.
Check out the
[docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/DateTimeFormat)
for those details.
