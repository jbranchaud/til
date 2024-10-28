# Concatenate Strings With A Separator

I was putting together an example of using a generated column that concatenates
string values from a few other columns. I used manual concatenation with the
`||` operator like so:

```sql
create table folders (
  id integer generated always as identity primary key,
  user_id integer not null,
  name text not null,
  parent_folder_id integer references folders(id),
  path text generated always as (
    user_id::text || ':' || lower(name) || ':' || coalesce(parent_folder_id::text, '0')
  ) stored
);
```

Instead of doing that manual concatenation for the `path` generated column, I
can use
[`concat_ws`](https://www.postgresql.org/docs/current/functions-string.html).

```sql
create table folders (
  id integer generated always as identity primary key,
  user_id integer not null,
  name text not null,
  parent_folder_id integer references folders(id),
  path text generated always as (
    concat_ws(
      ':',
      user_id::text,
      lower(name),
      coalesce(parent_folder_id::text, '0')
    )
  ) stored
);
```

The first argument to `concat_ws` is the separator I want to use. The remaining
arguments are the strings that should be concatenated with that separator.

One other things that is nice about `concat_ws` is that it will ignore `null`
values that it receives.

```sql
> select concat_ws(':', 'one', 'two', null, 'three');
+---------------+
| concat_ws     |
|---------------|
| one:two:three |
+---------------+
```
