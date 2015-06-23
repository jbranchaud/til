# Temporarily Disable Triggers

In general, you are always going to want your triggers to fire. That's why
they are there. Though special circumstances may arise where you need to
temporarily disable them. Use

```sql
> set session_replication_role = 'replica';
SET
```

By changing the
[replication role](http://www.postgresql.org/docs/9.4/static/runtime-config-client.html#GUC-SESSION-REPLICATION-ROLE)
from `origin` to
`replica` you are essentially disabling all non-replica triggers across the
database (for that session). When you are done, you can simply set the
replication role back so that normal trigger behavior can resume

```sql
> set session_replication_role = 'origin';
SET
```

A more direct and fine-grained approach to disabling triggers is to use an
`alter table` command that targets a specific trigger.

h/t Jack Christensen
