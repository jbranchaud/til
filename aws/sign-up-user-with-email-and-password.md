# Sign Up User With Email And Password

[AWS Amplify](https://aws.amazon.com/amplify/)
[Auth](https://docs.amplify.aws/lib/auth/getting-started/q/platform/js) offers
both federated and username/password based authentication. Though the docs
aren't clear, the required `username` parameter can be used as the email field
with the [`signUp`
API](https://aws-amplify.github.io/amplify-js/api/classes/authclass.html#signup).

```javascript
import { Auth } from 'aws-amplify';

async function signUp({ email, password }) {
  try {
    const user = await Auth.signUp({
      username: email,
      password,
      attributes: {},
    });
    console.log({ user });
  } catch (error) {
    console.log('error signing up:', error);
  }
}
```

Once the user has entered an email and password into the Sign Up form, those
values can be passed to this `signUp` function. The `email` value is passed as
the `username` and the `password` goes in as is.

Amplify Auth will interpret the `username` as an email and register it as the
contact email for this user.
