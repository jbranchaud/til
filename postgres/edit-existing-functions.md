# Edit Existing Functions

In the `psql` console, use `\ef` with the name of a function to fetch and
open the definition of the function. The function will be opened in your
system `$EDITOR` in the form of a `create or replace function` query.

Executing

```sql
> \ef now
```

will open the following in your default editor

```sql
CREATE OR REPLACE FUNCTION pg_catalog.now()
 RETURNS timestamp with time zone
 LANGUAGE internal
 STABLE STRICT
AS $function$now$function$
```
