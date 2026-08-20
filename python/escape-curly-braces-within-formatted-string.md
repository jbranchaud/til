# Escape Curly Braces Within Formatted String

Python's
[_f-string_](https://docs.python.org/3/reference/lexical_analysis.html#f-strings)
allows you to interpolate values into a string literal like so:

```python
>>> amount = 25
>>> print(f"Price: ${amount}")
Price: $25
```

The `{` and `}` are betting special treatment when `f` precedes the string
literal. So, what if the resulting string is supposed to have literal `{` and
`}` characters in it?

```python
>>> f"JSON opens and closes with curlies: {...}"
'JSON opens and closes with curlies: Ellipsis'
```

I need a way of escaping them. The trick is to double them up.

```python
>>> f"JSON opens and closes with curlies: {{...}}"
'JSON opens and closes with curlies: {...}'
```

A more practical example of where this is useful is in formatting an expected
string of JSON in a test:

```python
info_result = runner.invoke(cli, ["info", "--json"])
output = textwrap.dedent(f"""
{{
    "config_file": "{config_file}",
    "data_dir": "{data_dir}",
    "version": "{VMT_VERSION}",
    "schema_version": 1
}}
""").strip()
assert output in info_result.output
```

I'm doing some interpolation at various points in the string literal, but the
outer curly braces are meant to be literal, the opening and closing of the JSON
object.
