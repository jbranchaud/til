# Access Go Docs Offline

The Go language has a wonderfully comprehensive standard library. There is
documentation for all of it. You can access that documentation anytime if
you have an internet connection via
[https://golang.org/doc/](golang.org/doc/).

If you are without an internet connection, you're still in luck. Go has a
built-in feature for serving the documentation locally _offline_. Just run
the following command:

```
$ godoc -http=:6060
```

and then visit `localhost:6060`.

Note: if you do not already have `godoc` installed, you can install it with:

```bash
$ go install golang.org/x/tools/cmd/godoc@latest
```

[source](http://www.andybritcliffe.com/post/44610795381/offline-go-lang-documentation)
