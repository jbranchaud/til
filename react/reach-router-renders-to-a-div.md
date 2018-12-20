# @reach/router Renders To A Div

Check out the following snippet that uses
[`@reach/router`](https://reach.tech/router).

```javascript
import { Router } from '@reach/router';

const Home = () => <h1>Home</h1>;

const App = () => {
  return (
    <div className="main">
      <Router>
        <Home path="/home" />
      </Router>
    </div>
  );
}
```

When you visit '/home', this will render in the DOM as:

```html
<div class="main">
  <div tabindex="-1" role="group" style="outline: none;">
    <h1>Home<h1>
  </div>
</div>
```

Notice the extra `div` -- that is what `<Router>` renders to as part of
`@reach/router`'s accessibility features. This may throw off the structure
or styling of your app. This can be fixed. Any props that you give to
`<Router>` will be passed down to that `div`. For instance, you could remove
the most outer `div` and put `className="main"` on the `<Router>`.

[source](https://github.com/reach/router/issues/63#issuecomment-395988602)
