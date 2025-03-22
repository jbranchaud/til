# Show Reconstructed Constraints For A Table

The [`pg_get_constraintdef`
function](https://pgpedia.info/p/pg_get_constraintdef.html) can be used to
reconstruct the command for creating a given constraint. This isn't necessarily
the command (or commands) that originally created the constraint, but rather a
reconstruction.

We have to pass it an `oid` that corresponds to the constraint which we can get
from the `pg_constraint` table. These results can be further narrowed down by
the `conname` (constraint name) and `conrelid` (table name).

Here is an example of listing the constraints on a `reading_statuses` table.

```sql
> select
    conname,
    pg_get_constraintdef(oid)
  from pg_constraint
  where conrelid = 'reading_statuses'::regclass;

               conname               |                                                                               pg_get_constraintdef
-------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 reading_statuses_pkey               | PRIMARY KEY (id)
 fk_rails_17ee7cb2c4                 | FOREIGN KEY (user_id) REFERENCES users(id)
 fk_rails_0d3729339f                 | FOREIGN KEY (book_id) REFERENCES books(id)
 reading_statuses_valid_status_check | CHECK (((status)::text = ANY ((ARRAY['started'::character varying, 'completed'::character varying, 'abandoned'::character varying, 'already_read'::character varying])::text[])))
(4 rows)
```

I came across this while experimenting with [an idea for a fail-fast Rails
initializer
check](https://gist.github.com/jbranchaud/12813a0558f9cd06bcc24b7d8706550c)
that verifies the values of the `reading_statuses_valid_status_check` stay in
sync with the Rails version of those values that live in a constant.
