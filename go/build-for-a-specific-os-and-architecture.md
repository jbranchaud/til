# Build For A Specific OS and Architecture

Go programs can run anywhere, but you've got to create builds specific to
each operating system and architecture. This can be done when building by
specifying the `GOOS` and `GOARCH` environment variables.

For example, if you'd like to build a 32-bit Linux distribution:

```bash
GOOS=linux GOARCH=386 go build -o linux_386_build
```

The `GOOS` value specifies the operating system as Linux and the `GOARCH`
value of `386` specifies a 32-bit architecture.

The plethora of `GOOS` and `GOARCH` options can be found
[here](https://golang.org/doc/install/source#environment).
