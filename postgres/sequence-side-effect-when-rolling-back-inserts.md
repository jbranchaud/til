# Sequence Side-Effect When Rolling Back Inserts

What is so powerful about the transaction guarantees of a system like PostgreSQL
is that I can make all kinds of changes (big or small) within a transaction,
then roll it back, and it's like nothing ever happened.

This is useful if I want to dry-run an crucial update statement in the
production environment. I can gauge how many rows I expect to be impacted, run
the update in a transaction, inspect the state of the table, and rollback if
needed. It's like the changes never happened.

Rolled back transactions aren't completely free of side-effects. They can leave
a trace. In this case, that trace is increments to a sequence like you'd find
attached to a primary key. Each `insert` of a row into a table with an
autoincrementing sequence will have an effect on that sequence.

First, I'll create a fresh table and check the state of the sequence.

```sql
> create table books (id bigserial primary key, title text not null, author text not null);
CREATE TABLE

> select * from books_id_seq;
┌────────────┬─────────┬───────────┐
│ last_value │ log_cnt │ is_called │
├────────────┼─────────┼───────────┤
│          1 │       0 │ f         │
└────────────┴─────────┴───────────┘
(1 row)
```

Now, I'll start a transaction, do some inserts, and again check the state of the
sequence.

```sql
> begin;
BEGIN

> insert into books (title, author) values ('Python in a Nutshell', 'Martelli et al'), ('Build an LLM', 'Sebastian Raschka'), ('The Joy of Abstraction', 'Eugenia Cheng');
INSERT 0 3

> select * from books;
┌────┬────────────────────────┬───────────────────┐
│ id │         title          │      author       │
├────┼────────────────────────┼───────────────────┤
│  1 │ Python in a Nutshell   │ Martelli et al    │
│  2 │ Build an LLM           │ Sebastian Raschka │
│  3 │ The Joy of Abstraction │ Eugenia Cheng     │
└────┴────────────────────────┴───────────────────┘
(3 rows)

> select * from books_id_seq;
┌────────────┬─────────┬───────────┐
│ last_value │ log_cnt │ is_called │
├────────────┼─────────┼───────────┤
│          3 │      30 │ t         │
└────────────┴─────────┴───────────┘
(1 row)
```

I will now rollback the transaction. I expect `books` to be empty again. But
what happens to the state of `books_id_seq`?

```sql
> rollback;
ROLLBACK

> select * from books;
┌────┬───────┬────────┐
│ id │ title │ author │
├────┼───────┼────────┤
└────┴───────┴────────┘
(0 rows)

> select * from books_id_seq;
┌────────────┬─────────┬───────────┐
│ last_value │ log_cnt │ is_called │
├────────────┼─────────┼───────────┤
│          3 │      30 │ t         │
└────────────┴─────────┴───────────┘
(1 row)
```

Despite rolling back, the state of `books_id_seq` remains with a `last_value` of
`3`. This is because a sequence is used outside of transaction isolation.
Multiple concurrent transactions may both need sequence values. Instead of them
blocking on each other, the sequence can always be accessed. The tradeoff is
that the `last_value` of a sequence is always marching forward and gaps will
happen when transactions are rolled back.

This is normal and expected behavior. It is something to be aware of if you have
a high-volume system that is doing a ton of inserting and rolling back (I've
worked on systems that do this). However, the solution there is more to do with
picking `bigint` (`bigserial`) for your sequence-backed column. That would
reasonably eliminate concern for running out of sequence values. Or use UUIDs
instead.
