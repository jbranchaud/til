# Check The Password Confirmation With Yup

The [Yup](https://github.com/jquense/yup) library makes it easy to validate
individual values in a JavaScript object. A common situation when
implementing a Sign Up form is asking the user to input their password twice
and then the app can make sure they match.

To do this, we need the validation of our `passwordConfirmation` value to
reach outside of itself to make a comparison with the `password` value. This
can be done with Yup's `ref` function.

```javascript
import * as Yup from 'yup';

validationSchema: Yup.object({
  password: Yup.string().required('Password is required'),
  passwordConfirmation: Yup.string()
     .oneOf([Yup.ref('password'), null], 'Passwords must match')
});
```

We are able to reference the value of `password` with `ref`. We use the
`oneOf` function to ensure that `passwordConfirmation` either matches
`password` or if it is left blank and matches `null` then it passes the
validation for the time being. The second argument to `oneOf` is a custom
validation message when this validation fails.

[source](https://github.com/jaredpalmer/formik/issues/90)
