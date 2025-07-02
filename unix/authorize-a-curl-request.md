# Authorize A cURL Request

When making a cURL request to an endpoint that requires authentication,
sometimes you already have a bearer token and other times you have a username
and password pair. If you have a bearer token, you can format a `Authorization`
header with the `-H` flag that includes that value.

If you have a username and password for the API, you can instead use the `-u`
flag. The `-u` flag will format the username and password, base64 encode it,
and then add it as an `Authorization` header.

```bash
$ curl -v -u "username:password" https://some-endpoint.com/api/v1/status

...
> GET /api/v1/status HTTP/2
> Host: some-endpoint.com
> Authorization: Basic dXNlcm5hbWU6cGFzc3dvcmQK
> User-Agent: curl/8.1.2
...
```

You can even pass in only the username to the `-u` flag and cURL will know to
prompt you for the password. This is a nice way to avoid putting plain text
passwords in your shell history.

```bash
$ curl -v -u "username" https://some-endpoint.com/api/v1/status
Enter host password for user 'username':
```

See `man curl` for more details.
