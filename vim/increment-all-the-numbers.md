# Increment All The Numbers

Vim's substitution feature can be used for more than simple static text
replacement. Each replacement can be the result of some operation on the
original text. For instance, what if we'd like to increment all numbers in the
buffer? We can achieve this by searching for all numbers and then using `\=`
with `submatch`. Whenever the replacement string of a substitution starts
with `\=`, the remainder of the string is evaluated as an expression.

Given the following text in our buffer:

```
1 2 a b c 45 123 1982
```

We can run the following substitution command:

```
:%s/\d\+/\=submatch(0)+1/g
```

This will transform all digits in the buffer, resulting in:

```
2 3 a b c 46 124 1983
```

Want to decrement all the numbers instead?

```
:%s/\d\+/\=submatch(0)-1/g
```

See `:h sub-replace-expression` for more details.
