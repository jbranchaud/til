# Check The Syntax Of nginx Files

The syntax of [`nginx`](https://www.nginx.com/) configuration files can be a
bit finicky. On top of that, some `nginx` server commands can fail silently.
Get more confidence by using the following command to check for syntax
errors in those files:

```bash
$ [sudo] nginx -t
```

If there is an error, you might see something like this:

```bash
$ sudo nginx -t
nginx: [emerg] unexpected ";" in /etc/nginx/nginx.conf:16
nginx: configuration file /etc/nginx/nginx.conf test failed
```

If all looks good, then you'll see this:

```bash
$ sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```
