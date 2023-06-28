# Run A cURL Command Without The Progress Meter

By default when you run a `curl` command that will output to the terminal, it
disables the progress meter for the request. When the response output is
redirected or piped somewhere else however, the progress meter will be
displayed in the terminal.

```bash
$ curl -H "Content-Type: application/json" -G http://myurl.com | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  2515    0  2515    0     0   4184      0 --:--:-- --:--:-- --:--:--  4184
```

This can be disabled with the `-s` flag (which is short for `--silent`).

```bash
$ curl -s -H "Content-Type: application/json" -G http://myurl.com | jq
```

However, the `-s` flag will also suppress error messages. This is a bit
unhelpful. You can then add in the `-S` flag (short for `--show-error`) to
ensure that error messages are shown even while the progress meter is
suppressed.

```bash
$ curl -sS -H "Content-Type: application/json" -G http://myurl.com | jq
```

See `man curl` for more details.
