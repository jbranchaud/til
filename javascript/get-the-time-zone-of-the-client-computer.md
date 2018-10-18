# Get The Time Zone Of The Client Computer

The
[`resolvedOptions`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/DateTimeFormat/resolvedOptions)
function on `Intl.DateTimeFormat.prototype` provides a number of pieces of
information about the client computer. It includes information such as the
locale and the numbering system. It also has the time zone for that machine.

Try running this line of JavaScript in your own browser.

```javascript
$ Intl.DateTimeFormat().resolvedOptions().timeZone
```

When I run it, I get `America/Chicago`.

You can use this within your client-side code as a way of determining in
which time zone your users are.
