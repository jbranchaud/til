# Curling With Basic Auth Credentials

I often use `curl` to take a quick look at the responses of particular
endpoints. If I try to `curl` a URL that is secured with HTTP Basic
Authentication, this is what the response looks like:

```bash
$ curl staging.example.com
HTTP Basic: Access denied.
```

I can give the credentials to `curl` so that it can plug them in as it makes
the request using the `-u` (or `--user`) flag:

```bash
$ curl -u username:password staging.example.com
<html><body>...</body></html>
```

If I don't want the password showing up in my command-line history, I can
just provide the username and `curl` will prompt me for my password:

```bash
$ curl -u username staging.example.com
Enter host password for user 'username':
<html><body>...</body></html>
```

See `man curl` for more details.
