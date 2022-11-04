# Check If User Role Exists For Database

User roles define who can access a database cluster and broadly what level of
control they have over that cluster.

The most straightforward way to check if a user role exists is to connect to
one of the databases in the cluster and run a query against the `pg_roles`
table.

```sql
select * from pg_roles where rolename='dev';

  rolname
------------
    dev
(1 row)
```

This same concept can be used in a script when automating some database setup.
To do that, we'll use `-c` (and some other flags) to dispatch a query to `psql`
from a shell context.

```bash
psql postgres -tXAc "SELECT 1 FROM pg_roles WHERE rolname='dev'" \
  | grep -q 1 \
  || createuser --interactive dev
```

This queries for the value `1` if the user role named `dev` exists. The output
of that is piped to `grep` (in quiet mode, `-q`) to check if `1` is in the
output. If user roles doesn't exist and grep doesn't match on `1`, then the
right side of the _or_ (`||`) gets called. That command could be whatever. I've
chosen to call PostgreSQL's `createuser` to create the `dev` user role.
