# Access A Value Logged To The Console

Did your app just log an object to the dev tools console and you'd like to
interact with that object? It's not straightforward, but you can do it.

Assuming you already have dev tools opened to the _console_ tab, right click
on the value that has been logged to the console. Select the _Store as
Global Variable_ option. This will re-log the value assigning it to the
`temp1` variable.

You can now reference that object as `temp1` accessing its values and
calling functions.

You can even do this with multiple logged values, each subsequent one will
be assigned incrementing variable names: `temp2`, `temp3`, etc.

[source](https://stackoverflow.com/questions/15895579/access-last-logged-value-in-chrome-console)
