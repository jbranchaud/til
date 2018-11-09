# Easy Date Comparison With DayJS

Let's say my application fetches dates from the server which come back in
string form as `"YYYY-MM-DD"` and I'd like to know if those dates already
passed. This can be done easily by wrapping dates in
[DayJS](https://github.com/iamkun/dayjs) and using its comparison functions.

```javascript
import dayjs from 'dayjs';

const today = dayjs(new Date());
const pastDate = dayjs("2018-10-22");
const futureDate = dayjs("2022-01-01");

console.log(pastDate.isBefore(today));
// => true
console.log(futureDate.isBefore(today));
// => false
```

The `dayjs()` function can be used to construct DayJS date objects from Date
objects and strings. These can then be compared with functions like
`isBefore()` and `isAfter()`.
