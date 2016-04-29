# Use Not Valid To Immediately Enforce A Constraint

When adding a constraint to a table, you can optionally include `not valid`.
This tells Postgres that it doesn't need to enforce the constraint on
existing records in the table. At least not immediately. This constraint
will be enforced for any updates and subsequent insertions. Thus, you can
immediately enforce the constraint while giving yourself time to clean up
or massage any existing records that conflict with the constraint.

Here is an example of how you would add a constraint this way:

```sql
alter table boxes
add constraint check_valid_length
check (length > 0) not valid;
```

Eventually, you will want to ensure that all data in the table conforms to the
constraint. Once you get to that point, you can mark the constraint as valid
with a `validate constraint` command:

```sql
alter table boxes
validate constraint check_valid_length;
```

As long as all records are valid with respect to this constraint, it will be
marked as valid.

h/t Chris Erin
