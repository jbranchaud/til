# Find Records That Contain Duplicate Values

Let's say I have a `mailing_list` table that contains all the email addresses
that I want to send a mailing out to. Without a uniqueness constraint on the
`email` column, I can end up with multiple records containing the same email
address — duplicates.

Here are a couple queries for checking to see if any duplicate records exist
and which ones they are.

```sql
select email
from (
  select
    email,
    row_number() over (
      partition by email
      order by email
    ) as row_num
  from mailing_list
) t
where t.row_num > 1;
```

This is cool because it uses a [window
function](https://www.postgresql.org/docs/current/tutorial-window.html),
specifically the
[`row_number()`](https://www.postgresql.org/docs/current/functions-window.html)
window function, to assign an incrementing number to each row in the partition.

Here is another, conceptually simpler approach.

```sql
select
  email
  count(*)
from mailing_list
group by email
having count(*) > 1
order by email;
```

Though we cannot use a `where` clause with an aggregate (`count`), we can reach
for a `having` clause to grab only those results where we've found more than
`1` — duplicates.

[source](https://www.postgresqltutorial.com/how-to-delete-duplicate-rows-in-postgresql/)
