# Default Username And Password For New Instance

Let's say you've set up a fresh new instance of MySQL. Perhaps in a docker
container with a MySQL image. When you first connect to the instance, you'll be
prompted for a username and password.

What is the username and password for a MySQL instance you've just created?

There are defaults. The default username is `root` and the default password is
left blank.

So, your connection URL will look something like this:

```
mysql://root@localhost:3306
```

You can use that on the CLI or plug it in to the connection details panel of
your favorite SQL client.

[source](https://dev.mysql.com/doc/refman/8.0/en/default-privileges.html)
