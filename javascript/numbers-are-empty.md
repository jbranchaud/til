# Numbers Are Empty

The [`lodash`](https://lodash.com/) project comes with a ton of handy
JavaScript utilities including the
[`_.isEmpty()`](https://lodash.com/docs#isEmpty) function. This is great for
checking if Arrays, Objects, and Strings are _empty_. The following is how
this function is defined in the docs:

> Checks if value is an empty collection or object. A value is considered
> empty if it's an arguments object, array, string, or jQuery-like
> collection with a length of 0 or has no own enumerable properties.

Having not examined this definition too closely and because I primarily
write Rails code from day to day, I conflated `_.isEmpty()` with the
`#blank?` method provided by Rails' `ActiveSupport`. This holds true for the
most part, but quickly defies expectations when it comes to numbers.

```javascript
> _.isEmpty(1)
// true
```
