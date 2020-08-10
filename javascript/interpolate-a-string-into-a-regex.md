# Interpolate A String Into A Regex

You can build up strings with concatenation or the template literal syntax. If
you're incorporating variables as part of this string building, that's called
interpolation.

But what if you need to interpolate variables into a regular expression
(regex)?

A regex literal looks like this:

```javascript
const myRegex = /^Some Customizable Text$/;
```

This works great for fixed strings, but won't cut it if you need to work
_variable_ strings.

What's needed to work with variables is the
[`RegExp`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp)
constructor:

```javascript
const customizableString = "Some Customizable Text";
const myRegex = new RegExp(`^${customizableString}$`);
```

You can build up some string with string variables and regex syntax and `new
RegExp()` will turn it into a regex.

[source](https://makandracards.com/makandra/15879-javascript-how-to-generate-a-regular-expression-from-a-string)
