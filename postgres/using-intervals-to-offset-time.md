# Using Intervals To Offset Time

Postgres Intervals can be used with time as a way of determining a
standard offset. For instance, I can concisely determine what the time was 2
hours earlier with

```sql
> select now() - '2 hours'::interval as earlier;
            earlier
-------------------------------
 2015-06-12 21:17:43.678822-05
```

or similarly

```sql
> select now() - interval '2 hours' as earlier;
            earlier
-------------------------------
 2015-06-12 21:17:43.678822-05
```
