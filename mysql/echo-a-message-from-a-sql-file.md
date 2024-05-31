# Echo A Message From A SQL File

Let's say we have a SQL file that we run to seed our database. We want to echo
a message to stdout at the beginning of that file's execution. We can do this
with [a MySQL client _shell
command_](https://dev.mysql.com/doc/mysql-shell/8.0/en/mysql-shell-commands.html).
Specifically, we need to use the `\system` or `\!` command to run our system's
`echo` command.

Here is what that could look like:

```sql
\! echo '*****************************************'
\! echo '*                                       *'
\! echo '*  Loading seed data into the database  *'
\! echo '*                                       *'
\! echo '*****************************************'

insert into products ...
```

That message banner will be output when you run the script.

```bash
$ mysql -h ::1 -P 3306 -u root -D local_database < seed_data.sql

*****************************************
*                                       *
*  Loading seed data into the database  *
*                                       *
*****************************************
```
