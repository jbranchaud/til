# Use A Trigger To Mirror Inserts To Another Table

On a PostgreSQL server, a trigger can be set up to execute a function whenever
a certain action happens. In this case, I want set up a trigger to call a
custom function whenever an `insert` happens on a specific table
(`original_table`). That custom function will then mirror the inserted values
into a secondary table (`another_table`).

First, I have to create a function that will respond to `insert` operations by
inserting the newly inserted rows into `another_table`.

```sql
create or replace function mirror_table_to_another_table()
  returns trigger as $mirrored_table$
    begin
      if (TG_OP = 'INSERT') then
        insert into another_table
          select * from new_table;
      end if;
      return null; -- result is ignored since this is an after trigger
    end;
$mirrored_table$ language plpgsql;
```

This function can then be referenced by the trigger I set up. After any insert
on the `original_table`, the function defined above will be executed.

```sql
create trigger mirror_table_to_another_table_trigger
  after insert on original_table
  referencing new table as new_table
  for each statement
    execute function mirror_table_to_another_table();
```

Note that I am handling inserts at a statement level and that multiple rows can
be inserted in a single statement. That is why the function mirrors to the
other table with `select * from new_table`.
