# Build And Install A Go Program

With the [`vim-go`](https://github.com/fatih/vim-go) plugin, Vim gets all
kinds of support for working with a Go project. Generally, with a Go
project, you have to run `go build` to compile the project and if that is
successful, you can run `go install` to put the executable binary on the
`$GOPATH`.

This plugin allows you to tighten the feedback loop. You can build right
within your Vim session using

```
:GoBuild
```

which will alert you to any compilation errors.

You can then install the program using

```
:GoInstall
```

Your program is now ready to run.

It's worth noting that this plugin will also notify you about syntax errors
when you save, if they exist.
