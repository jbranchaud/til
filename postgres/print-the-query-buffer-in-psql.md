# Print The Query Buffer In psql

I'll often be composing a PostgreSQL query in Vim and decide I want to give
it a try in `psql`. I copy the relevant snippet of SQL to my system buffer
and then paste into `psql`. I'm usually hit with a mess of text like this
though:

```sql
jbranchaud=# create table nullable_fields (
jbranchaud(#   id serial primary key,
  first varchar,
  last varchar
)
  id serial primary key,
jbranchaud(#   first varchar,
  last varchar
)
  first varchar,
jbranchaud(#   last varchar
)
  last varchar
jbranchaud(# )
)
jbranchaud-#
```

Yikes. That's not readable. Fortunately, `psql` provides a command for
printing the current contents of the query buffer. By typing `\p` I'll see a
more readable version of what I just pasted in.

```sql
jbranchaud-# \p
create table nullable_fields (
  id serial primary key,
  first varchar,
  last varchar
)
jbranchaud-#
```

After taking another glance at the snippet of SQL, I decide to complete the
query to create my new table.

```sql
jbranchaud-# ;
CREATE TABLE
```
