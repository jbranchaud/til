# String Interpolation With Template Literals

ES6 adds support for [template
literals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals).
Template literals make it much easier to compose strings of content --
string interpolation. They allow for single and double quotes without having
to fuss with escaping.  Embedded expressions are also supported which means
you can avoid awkward-to-type string concatenation with the `+` operator.

Here is an example:

```javascript
> let movie = 'it'
undefined
> `What's up, I just saw "${movie.toUpperCase()}".`
"What's up, I just saw "IT"."
```
