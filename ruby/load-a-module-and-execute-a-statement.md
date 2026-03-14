# Load A Module And Execute A Statement

Here is a nice one-liner pattern for use with the `ruby` executable.

```bash
$ ruby -r file.rb -e 'MyClass.do_something'
```

The `-r` flag loads (requires, really) a Ruby file at the specified path. The
`-e` flag will execute the line of Ruby code that you give it, in that context.
In combination that means I can load some module into the execution environment
and then I can run some code that uses that module.

A more practical example of that is how I demonstrated the behavior of a
`MarkdownHelpers` module in [Create A Module Of Utility
Functions](create-a-module-of-utility-functions.md).

```bash
$ ruby -r ./markdown_helpers.rb -e 'puts MarkdownHelpers.link("Click here", "https://example.com")'
[Click here](https://example.com)
```

The `MarkdownHelpers` module that I've defined in `./markdown_helpers.rb` is
loaded into context and I can now access and execute that module to try out
parts of it. All in a single line in the terminal.
