# Doing Date Math

MySQL has an array of functions for interacting with `date` and `datetime`
values. If you'd like to do math with a date to compute a date in the future
or the past, you can use the
[`DATE_ADD()`](https://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html#function_date-add)
and
[`DATE_SUB()`](https://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html#function_date-sub)
functions.

```mysql
mysql> select now() Now, date_add(now(), interval 10 minute) '10 Minutes Later';
+---------------------+---------------------+
| Now                 | 10 Minutes Later    |
+---------------------+---------------------+
| 2018-10-18 15:53:29 | 2018-10-18 16:03:29 |
+---------------------+---------------------+

mysql> select now() Now, date_sub(now(), interval 9 day) '9 Days Earlier';
+---------------------+---------------------+
| Now                 | 9 Days Earlier      |
+---------------------+---------------------+
| 2018-10-18 15:54:01 | 2018-10-09 15:54:01 |
+---------------------+---------------------+
```

There are equivalent `ADDDATE()` and `SUBDATE()` functions if you prefer.

Check out [the
docs](https://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html)
for more details.
