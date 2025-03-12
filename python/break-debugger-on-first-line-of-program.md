# Break Debugger On First Line Of Program

One of the things I appreciate about how
[Delve](https://github.com/go-delve/delve) (the debugger for Go) works by
default is that when you start it up, it immediately breaks on the first line
of the program. This is as good a starting point as any regardless of whether
you have other breakpoints set.

As I was reading through the VS Code Python Debugger configuration docs, I
noticed [an option called
`stopOnEntry`](https://code.visualstudio.com/docs/python/debugging#_stoponentry).
It is turned off by default, but if you turn it on, then you get the same
behavior as I described for Delve. Nice!

This can be configured in a `.vscode/launch.json` file:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Python Debugger: Current File",
      "type": "debugpy",
      "request": "launch",
      "program": "${file}",
      "console": "integratedTerminal",
      "stopOnEntry": true
    }
  ]
}
```

Now, when running this debugger configuration profile, you'll break the
debugger on the first line of the program. From there add more breakpoints,
start stepping through, etc.
