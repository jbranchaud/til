# Format A List Of Items By Locale

The `Intl` module includes a [`ListFormat`
object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/ListFormat)
which can be used to format a list of items in a consistent way across locales.

I've reinvented the wheel of writing a helper function numerous times across
projects for formatting a list of items that accounts for formatting based on
how many items there are. This built-in function handles that with the added
benefit of working across locales.

Here are lists of three, two, and one items formatted in the `long` styles for
US english.

```javascript
> const formatter = new Intl.ListFormat('en', { style: 'long', type: 'conjunction' });
undefined

> formatter.format(['Alice', 'Bob', 'Carla'])
'Alice, Bob, and Carla'

> formatter.format(['Coffee', 'Tea'])
'Coffee and Tea'

> formatter.format(['Taco'])
'Taco'
```

The difference between `long` and `short` style for a `conjunction` is _and_
versus _&_. In addition to the type`conjunction`, you could also use
`disjunction` which will do an _or_ instead of an _and_. I'm not sure what
you'd use the `unit` type for.

You could use another locale, such as French, as well:

```javascript
> const formatter = new Intl.ListFormat('fr', { style: 'long', type: 'conjunction' });
undefined

> formatter.format(['café', 'thé'])
'café et thé'
```
