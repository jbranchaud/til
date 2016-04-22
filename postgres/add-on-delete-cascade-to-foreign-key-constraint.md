# Add ON DELETE CASCADE To Foreign Key Constraint

The `alter table` command lets you do quite a bit. But when it comes to
altering existing constraints, there is not much you can do. If you want to
add an `on delete cascade` to an existing foreign key constraint, you are
going to need two statements.

The first statement will drop the constraint and the second statement will
recreate it with the addition of the `on delete` clause. Furthermore, you'll
want to do this in a transaction to ensure the integrity of your data during
the transition between indexes.

Here is an example:

```sql
begin;

alter table orders
drop constraint orders_customer_id_fkey;

alter table orders
add constraint orders_customer_id_fkey
foreign key (customer_id)
references customers (id)
on delete cascade;

commit;
```

[source](http://stackoverflow.com/questions/10356484/how-to-add-on-delete-cascade-constraints)
