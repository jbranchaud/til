# Timestamp Functions

There are a handful of timestamp functions available in postgres. The most
common one is probably `now()`. This is an alias of
`transaction_timestamp()` which the postgres docs describe as:

> Current date and time (start of current transaction)

Two other interesting timestamp functions are `statement_timestamp()` and
`clock_timestamp()`. The postgres docs describe `statement_timestamp()` as:

> Current date and time (start of current statement)

Using `statement_timestamp()` throughout a transaction will yield different
results from statement to statement.

The postgres docs describe `clock_timestamp()` as:

> Current date and time (changes during statement execution)

Using `clock_timestamp()` may even yield different results depending on
where it appears in a given statement.

Try running something like this to see:

```postgresql
> select clock_timestamp(), clock_timestamp(), clock_timestamp(), clock_timestamp();
        clock_timestamp        |        clock_timestamp        |        clock_timestamp        |        clock_timestamp        
-------------------------------+-------------------------------+-------------------------------+------------------------------
 2015-03-20 14:58:49.832592-05 | 2015-03-20 14:58:49.832592-05 | 2015-03-20 14:58:49.832593-05 | 2015-03-20 14:58:49.832593-05
```

You'll notice that we see a change in the clock time at the microsecond
level mid-way through the statement.

sources: [postgres docs](http://www.postgresql.org/docs/9.1/static/functions-datetime.html) and
[Jack C.](http://hashrocket.com/team/jack-christensen)
