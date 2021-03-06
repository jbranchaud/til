# Get Your Public IP Address

If you're trying to figure out what your current public IP address is, there is
a server you can ask. It is a server running at `https://ifconfig.me`.

You can visit that URL in your browser to find your IP address and some other
User Agent/Request details. The site also mentions several `cURL` commands you
can run to get these details in your terminal.

```bash
$ curl ifconfig.me
```

That will respond with just your public IP address. It is equivalent to curling
`ifconfig.me/ip`.

There are other options as well, such as curling for a JSON response of all the
data attributes.

```bash
$ curl ifconfig.me/all.json
```

See [ifconfig.me](https://ifconfig.me) for more details.

[source](https://www.mfitzp.com/article/use-ifconfigme-to-return-your-ip-and-host/)
