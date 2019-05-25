# Formik Connected Components

Formik comes with a `connect()` HOC that uses the context API as a way of
connecting to disparate form elements. This means that form data, change
handlers, touched and error data, etc. can be easily accessed without a lot of
[prop drilling](https://kentcdodds.com/blog/prop-drilling).

Any component that lives somewhere downstream in the tree of a Formik form can
use `connect()`.

```javascript
import { connect, getIn } from "formik";

const Input = ({ type = "text", name, id, label, formik }) => {
  return (
    <React.Fragment>
      <label htmlFor={name}>{label}:</label>{" "}
      <input
        type={type}
        onChange={formik.handleChange}
        onBlur={formik.handleBlur}
        value={getIn(formik.values, name)}
        name={name}
        id={id}
      />
    </React.Fragment>
  );
};

export default connect(Input);
```

This `Input` component is wrapped in `connect` which means it gets the `formik`
prop which contains everything that we mentioned and more -- all the context
you'll need to make your form element work.

You can play around with it using this [live
example](https://codesandbox.io/s/quizzical-hill-7xlwi).
