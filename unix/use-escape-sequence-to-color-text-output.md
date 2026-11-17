# Use Escape Sequence To Color Text Output

When I run an echo command like the following, unstyled white text will be used
when outputting the word 'Hello' to the terminal.

```bash
❯ echo Hello
Hello
```

It is easy for a terminal to become flooded with white text. When everything is
one color with monospace font, it can be hard for scripts to convey specific or
important meaning in their output.

Virtually all Unix-like shells support the escape sequences that allow for
adding color and sometimes other styles. To add some color to text output, we
have to define an escape sequence that give instructions to the shell about what
color to use.

We mark the beginning of an escape sequence with the `ESC` byte in octal. The
`\0` indicates an octal value, rather than a base-10 one, and then `33`
corresponds to the `ESC` character. That followed by `[` starts the escape
sequence. The value `31` happens to be red. Lastly, we terminate this with `m`
which indicates this is an SGR (Select Graphic Rendition) escape sequence
(meaning it is meant to color and style text).

Putting that all together, I get `\033[31m`. Any text that follows that is going
to be rendered as red. Notice in the second example that I add a `\033[0m` in
the middle. That is the _reset_ escape sequence which sets the color back to
white. The `Hello` is then in red, while `, World!` is all in white.

```bash
❯ echo '\033[31mHello'
Hello

❯ echo '\033[31mHello\033[0m, World!'
Hello, World!
```

These are simple examples, but when used to its full potential there is a lot of
style we can add to our scripts and other text that renders in the terminal.
