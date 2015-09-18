# List Database Users

Within `psql`, type `\du` to list all the users for a database and their
respective permissions.

```bash
> \du
                              List of roles
 Role name  |                   Attributes                   | Member of
------------+------------------------------------------------+-----------
 jbranchaud | Superuser, Create role, Create DB, Replication | {}
 sampleuser | Create DB                                      | {}
 ```
