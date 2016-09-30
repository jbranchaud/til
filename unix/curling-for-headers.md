# Curling For Headers

If you want to inspect the headers of a response from some endpoint, look no
further than a quick `curl` command. By including the `-I` flag, `curl` will
return just the headers.

For example, if you are developing a web app that is being locally served at
`localhost:3000` and you'd like to see what the headers look like for a
particular URL, you might try something like the following command:

```bash
$ curl -I localhost:3000/posts
```

h/t Dillon Hafer
