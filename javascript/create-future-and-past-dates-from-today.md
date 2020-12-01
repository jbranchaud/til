# Create Future And Past Dates From Today

JavaScript's built-in
[`Date`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date)
object can be frustrating to work with at times.  It does, however, lend itself
nicely to some date math. You have to familiarize yourself with some of the API
and then it is a matter of addition and subtraction.

Here is today:

```javascript
const today = new Date();
// Tue Dec 01 2020 ...
```

Let's make a copy of today and send it 30 days into the future:

```javascript
const future = new Date(today);
future.setDate(future.getDate() + 30);
future
// Thu Dec 31 2020 ...
```

Or we could jump back a few years:

```javascript
const past = new Date(today);
past.setFullYear(past.getFullYear() - 4);
past
// Thu Dec 01 2016 ...
```

[source](https://stackoverflow.com/questions/7908098/javascript-set-date-30-days-from-now/7908122#7908122)
