# Quickly Bootstrap A React App Using Reason

The ReasonML language and ecosystem is great for developing React apps. As
you might expect from the React community, there is a set of `reason-scripts`
for a ReasonML/React project which works similarly to the standard
[`create-react-app`](https://github.com/facebook/create-react-app) scripts.

First, you need to install the [BuckleScript
platform](https://github.com/BuckleScript/bucklescript) and this must be
done using `npm`.

```bash
$ npm install -g bs-platform
```

From there, it is a matter of using the [`yarn
create`](https://yarnpkg.com/lang/en/docs/cli/create/) command to generate a
React app that uses the aforementioned
[`reason-scripts`](https://yarnpkg.com/lang/en/docs/cli/create/).

```
$ yarn create react-app my-reason-react-app --scripts-version reason-scripts
```

Next steps from here are documented in the `README.md` and should be
familiar to anyone who has used `create-react-app` in the past.
