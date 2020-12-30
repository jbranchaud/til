# Curl With Cookies

Some endpoints require certain cookies to be included in order to get the
response you are looking for. For instance, if the endpoint is authenticated
with a session cookie, then you will need to provide that session cookie when
curling.

The `-b` flag can be used to instruct `curl` to include a cookie in the header
of a request.

```bash
$ curl -b session=abc123SessionToken https://authenticated-url.com
```

See `man curl` for more details and other flags.
