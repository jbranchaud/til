# Convert Seconds To Date Object

Let's say you have an integer that represents the number of seconds since the
unix epoch. This is a reasonably common way for systems to represent a date.

For example, `1713350171` is an _Expiration Date_ I just got from an API.

But how do we know what date that actually represents and how can we get a
JavaScript `Date` object from that value?

The `new Date()` constructor can produce a date object given an integer. That
integer is not supposed to be seconds since the unix epoch though. See what we
get here:

```javascript
> new Date(1713350171)
1970-01-20T19:55:50.171Z
```

Something is off. The integer that you pass to `new Date()` needs to be the
_number of milliseconds_ since the unix epoch. We can get there by multiplying
our _seconds_ value by `1000`.

```javascript
> new Date(1713350171 * 1000)
2024-04-17T10:36:11.000Z
```

Not only can we, as humans, read that date, but we have a `Date` object that we
can use within our program.

Note: if you execute `Date.now()`, the value you get is in milliseconds.
