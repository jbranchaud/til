# Create A Snowpack-Bundled React App

> [Snowpack](https://www.snowpack.dev/) is a modern, lightweight toolchain for
> web application development.

You can get started using snowpack with this `npx` command.

```bash
npx create-snowpack-app my-app
```

This command uses a base template that is pre-configured to use the snowpack
defaults.

You can take this a step further by using a specialized template for React
apps.

```bash
npx create-snowpack-app react-client --template @snowpack/app-template-react
```

An advantage this has over
[create-react-app](https://github.com/facebook/create-react-app) is there is no
ejecting needed to do something like pull in [PostCSS](https://postcss.org/).
