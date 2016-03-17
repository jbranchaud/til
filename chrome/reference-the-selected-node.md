# Reference The Selected Node

In the Chrome dev tools, if you've selected (highlighted) a node in the DOM,
you can reference that node from the console with `$0`. This is handy if you
are debugging or exploring certain parts of a page and need to run commands
against that node. For instance, if you were to select the `<html>` node in
the DOM, you could then programmatically check the `lang` attribute from the
console like so:

```
> $0.lang
// "en-US"
```

If there is `jQuery` on the page and you've selected the node that contains
all of the page's content, you can do something like the following:

```
> $($0).html('<h1>Hello, World!</h1>')
```
