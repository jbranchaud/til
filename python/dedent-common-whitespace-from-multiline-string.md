# Dedent Common Whitespace From Multiline String

I'm adding tests to cover some custom logic in the _usage_ messages that are
produced by Click [in a CLI I'm building](https://github.com/jbranchaud/py-vmt).
The usage output is a mutliline string formatted with some indentation. On top
of that, I'm putting it in a Python test file with some additional syntactical
indentation.

If this was Ruby, I would reach for the `<<~` heredoc syntax. The closest
equivalent to that in Python is
[`textwrap.dedent`](https://docs.python.org/3/library/textwrap.html#textwrap.dedent).

> Remove any common leading whitespace from every line in text.
> 
> This can be used to make triple-quoted strings line up with the left edge of
> the display, while still presenting them in the source code in indented form.

```python
import textwrap

def test_base_help_message():
    runner = BetterCliRunner()

    help_result = runner.invoke(cli, ["--help"])
    output = textwrap.dedent("""\
    Usage: vmt [OPTIONS] COMMAND [ARGS]...

    Options:
      -v, --verbose  See extra output when running commands
      --help         Show this message and exit.

    Commands:
      cancel
      log
      start
      status
      stop
    """)
    assert output in help_result.output
```

Before adding in `textwrap.dedent`, the test was failing because of bits of
extra whitespace that wasn't matching up with the actual CLI output.

Note: the leading `\` after the opening `"""` is needed to remove the leading
newline that would otherwise be included.
