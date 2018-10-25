# Formik's Validation Schema As A Function

The most straightforward way to use
[Formik](https://jaredpalmer.com/formik)'s `validationSchema` is to provide
it with a [Yup](https://github.com/jquense/yup) object defining your form's
validations.

```javascript
const MyComponent = withFormik({
  // ...

  validationSchema: yup.object().shape({
    email: yup.string().required(),
    feedback: yup.string().required(),
  }),
  
  // ...
})(MyForm);
```

There may be a point at which you need access to the `props` being passed
to `MyComponent` in order to construct the proper set of validations.
Formik supports this by allowing `validationSchema` to be a function.

```javascript
const MyComponent = withFormik({
  // ...

  validationSchema: (props) => {
    let emailSchema;
    if(props.allowAnonymous) {
      emailSchema = yup.string();
    } else {
      emailSchema = yup.string().required();
    }

    return yup.object().shape({
      email: emailSchema,
      feedback: yup.string().required(),
    });
  },
  
  // ...
})(MyForm);
```

When `validationSchema` is a function, its first argument is the set of
props passed to that component.
