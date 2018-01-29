# Dispatch Anywhere With Redux

Your React app is going to have a single top-level `store` which is
connected to the app with the `Provider` component. Most of the time, when
you create a connected component, you'll create prop functions that dispatch
on a redux action.

This isn't the only place you can dispatch though.

If you export your `store`, then it can be imported anywhere along with its
`dispatch` function.

```javascript
// src/index.js
export const store = createStore(rootReducer);
```

```javascript
// src/components/MyComponent.js
import { store } from '../index';
import { updateData } from '../actions';

// ...

  componentDidMount() {
    getData().then((json) => {
      store.dispatch(updateData(json));
    }
  }
```

See the [`dispatch`](https://redux.js.org/docs/api/Store.html#dispatch)
documentation for more details.
