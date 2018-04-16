# Sync Your react-router State With Redux

If you are building a React app that uses both `redux` and `react-router`,
you'll find that you are managing app state in two places. Most of your app
state is in `redux`. The router-specific state is component-state in the
`Router`.

You can unify it all in `redux` with
[`react-router-redux`](https://github.com/ReactTraining/react-router/tree/master/packages/react-router-redux).

You'll need to apply some middleware, combine `routerReducer` with the rest
of your reducers, and then swap out your `BrowserRouter` with a
`ConnectedRouter`. You can read about the details
[here](https://github.com/ReactTraining/react-router/tree/master/packages/react-router-redux).
