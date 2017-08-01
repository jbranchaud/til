# Create Bootstrapped Apps With Yarn

The [`yarn` cli](https://yarnpkg.com/lang/en/docs/cli/) comes with a
[`create`](https://yarnpkg.com/blog/2017/05/12/introducing-yarn/) command
that is a convenience command for generating bootstrapped apps that follow
the `create-<name>-app` convention.

Want to create a React.js app using
[`create-react-app`](https://github.com/facebookincubator/create-react-app),
invoke the following command:

```
$ yarn create react-app my-app
```

Don't already have a particular package globally installed? `yarn create`
will install it for you. For instance, the following command with install
and use [`create-vue-app`](https://github.com/egoist/create-vue-app):

```
$ yarn create vue-app my-other-app
```

h/t Gabe Reis
