# Yup Schemas Are Validated Asynchronously 

[Yup](https://github.com/jquense/yup) provides a flexible object schema
validation DSL. For instance, if you want to enforce that a certain value is
a number, you can define something like this:

```javascript
const numSchema = yup.number();
```

You can then validate anything against that schema.

```javascript
const validator = (val) => {
  numSchema.validate(val)
    .then(result => {
      console.log(result); // it is the value of `val`
      return true;
    })
    .catch(error => {
      console.log(error.errors); // array of validation error messages
      return false;
    });
};
```

The validation is async, so if it succeeds the `then` block is hit. If the
validation fails, it will fall through to the `catch`.

```javascript
validator(5) // => true
validator('what') // => false
```
