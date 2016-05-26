# Assumed Radius Of The Earth

Using the
[`earthdistance`](https://www.postgresql.org/docs/8.3/static/earthdistance.html)
module, we can get the assumed radius of the earth (in meters).

```sql
> create extension cube;
CREATE EXTENSION

> create extension earthdistance;
CREATE EXTENSION

> select earth();
  earth
---------
 6378168
```
