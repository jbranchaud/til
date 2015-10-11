# Watch The Difference

The `watch` command is a simple way to repeatedly run a particular command.
I'll sometimes use it to monitor the response from some endpoint. `watch`
can make monitoring responses even easier when the `-d` flag is employed.
This flag instructs `watch` to highlight the parts of the output that are
*different* from the previous run of the command.

So if I run

```
$ watch -d curl -LIs localhost:3000
```

I can easily see if the http status of the request changes.
