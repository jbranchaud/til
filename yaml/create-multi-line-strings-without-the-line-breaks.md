# Create Multi-Line Strings Without The Line Breaks

There are [many ways](https://stackoverflow.com/a/21699210/535590) to add
multi-line strings to a YAML document. Most of them preserve the literal
newlines present in the multi-line string. And generally that is what you want
in a multi-line string.

Sometimes, however, you want a multi-line string just for its readability in
the file. The literal representation of the string should exclude the newlines.
To achieve this, you can use either `>-` or `|-`.

```yaml
run: >-
  echo "::set-output name=NODE_VERSION::$(
    cat .tool-versions
    | grep nodejs
    | sed 's/nodejs \(.*\)$/\1/'
  )"
```

This creates a readable key-value pair without introducing newline characters
into the string that represents a shell command.
