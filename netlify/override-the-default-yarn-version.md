# Override The Default Yarn Version

When you first deploy an app to [Netlify](https://www.netlify.com/), the
current default [Yarn](https://yarnpkg.com/) version will be locked in. This
Yarn version will be used for future builds and deployments.

You can override the default Yarn version by including the `YARN_VERSION`
environment variable. Set it to the desired major and minor version in the app
settings panel. The next deployment will use that new version.

[source](https://community.netlify.com/t/default-yarn-version-is-now-1-17/2297)
