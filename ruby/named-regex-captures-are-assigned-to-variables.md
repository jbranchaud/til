# Named Regex Captures Are Assigned To Variables

Both `String` and `Regexp` include the `=~` operator as a way of checking if a
string and a regex match.

When the `Regexp` version of
[`=~`](https://ruby-doc.org/core-2.5.1/Regexp.html#method-i-3D~) with named
capture groups, those named captures will be auto-assigned as local variables.

Here is a regex that includes a named capture: `(?<id>\d+)`. The parentheses
define the capture area and the `?<id>` specifies that whatever follows in the
capture will be named `id`.

```
/Tile: (?<id>\d+)/ =~ 'Tile: 1234'
#=> 0
id
=> "1234"
```

After the match operator (`=~`) runs in the first line, the local variable `id`
gets assigned to whatever it matches in the corresponding string.

[source](https://ruby-doc.org/core-2.5.1/Regexp.html#class-Regexp-label-Capturing)
