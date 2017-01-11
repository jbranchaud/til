# Set ISOLATION level

Last I were wondering what's happen if in the middle of transaction data get inserted :

```SQL
BEGIN;

INSERT INTO sensor_log_a
SELECT id, location
FROM sensor_log
INNER JOIN sensor_location_to_insert USING (location);

-- data get inserted here

INSERT INTO sensor_log_b
SELECT id, location
FROM sensor_log
INNER JOIN sensor_location_to_insert USING (location);

COMMIT;
```

Does the `SELECT` will result in a different number of rows. The [anwser](http://dba.stackexchange.com/a/160171/100437) is :

> A statement sees a consistent view of the "world" based on the data that was there when the statement started. So the select statements in your two insert statements will not see new rows while they are running.

> However, if the table is changed between running the two statement (or after the first one started), each select statement could see different data e.g the first one sees 100 rows, the second one 200.

> If you want to ensure that the whole transaction sees a consistent view of the data, use a higher isolation level. In your case using repeatable read would be enough.

Then I learnt about `TRANSACTION ISOLATION LEVEL REPEATABLE READ` doc : https://www.postgresql.org/docs/current/static/sql-set-transaction.html

> All statements of the current transaction can only see rows committed before the first query or data-modification statement was executed in this transaction.

I can now use:

```SQL
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

INSERT INTO sensor_log_a
SELECT id, location
FROM sensor_log
INNER JOIN sensor_location_to_insert USING (location);

-- data get inserted here will not change the result of next select

INSERT INTO sensor_log_b
SELECT id, location
FROM sensor_log
INNER JOIN sensor_location_to_insert USING (location);

COMMIT;
```

Both `SELECT` will have the same result because we define the isolation level to state the result after the first query.
