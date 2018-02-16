# New Dates Can Take Out Of Bounds Values

You can create a new date by feeding it arguments for _year_, _month_, and
_day_.

```javascript
> new Date(2017, 11, 31)
Sun Dec 31 2017 00:00:00 GMT-0600 (CST)
```

What happens if we push the _day_ value out of bounds?

```javascript
> new Date(2017, 11, 32)
Mon Jan 01 2018 00:00:00 GMT-0600 (CST)
```

It rolls over to the next month.

Does the same happen when we push the _month_ value out of bounds?

```javascript
> new Date(2017, 12, 31)
Wed Jan 31 2018 00:00:00 GMT-0600 (CST)
```

Yep.

What about negative values?

```javascript
> new Date(2018, -1, 31)
Sun Dec 31 2017 00:00:00 GMT-0600 (CST)
```

It rolls the month, and consequently the year, back.
