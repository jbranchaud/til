# Better Module Imports With Aliases

Depending on how your JavaScript project is structured, you can end up with
import statements that look like this:

```javascript
import SomeComponent from 'app/assets/javascripts/components/SomeComponent.jsx';
```

or this:

```javascript
import SomeComponent from '../components/SomeComponent.jsx';
```

The first is simply too long and the second is both ugly and brittle to
changes in file location. This can all be _resolved_ with a
[Webpack](https://webpack.github.io/) alias.

```javascript
// webpack.config.js
resolve: {
  alias: {
    components: "app/assets/javascripts/components",
  },
},
```

Webpack will use this `alias` when resolving module imports like the
following updated example:

```javascript
import SomeComponent from 'components/SomeComponent.jsx';
```

See the
[`resolve.alias`](https://webpack.github.io/docs/configuration.html#resolve-alias)
section of the Webpack docs for more details.

h/t Vidal Ekechukwu
