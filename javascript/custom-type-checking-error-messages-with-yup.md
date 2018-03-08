# Custom Type Checking Error Messages With Yup

In [Yup Schemas Are Validated
Asynchronously](https://github.com/jbranchaud/til/blob/master/javascript/yup-schemas-are-validated-asynchronously.md),
I showed how to create a simple schema that allows you to enforce that a
value is a number.

```javascript
const numSchema = yup.number();
```

If we use this schema to validate something that isn't a number, Yup will
provide a lengthy default message. Here is what we get if we validate against
`'hey'`:

> this must be a `number` type, but the final value was: `NaN` (cast from
> the value `"hey"`).

This value isn't necessarily suitable for displaying to a user. We can
customize the type checking error message by redefining our schema with the
`typeError()` function:

```javascript
const numSchema = yup.number().typeError("Invalid number");
```
