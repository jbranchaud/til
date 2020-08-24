# Test A Component That Uses React Portals

When using
[react-testing-library](https://testing-library.com/docs/react-testing-library/intro)
to render a component that uses
[Portals](https://reactjs.org/docs/portals.html), you'll probably run into an
issue with your `Portal` code. When trying to set up the portal, it will fail
to find the portal's root element in the DOM.

```javascript
const portalRoot =
  global.document && global.document.getElementById("portal-root");
// portalRoot is null 😱
```

There are [a number of
solutions](https://github.com/testing-library/react-testing-library/issues/62).
[One
solution](https://github.com/testing-library/react-testing-library/issues/62#issuecomment-438653348),
recommended by KCD, is to add the portal's root element to the document if it's
not already there.

```javascript
let portalRoot =
  global.document && global.document.getElementById("portal-root");

if (!portalRoot) {
  portalRoot = global.document.createElement("div");
  portalRoot.setAttribute("id", "portal-root");
  global.document.body.appendChild(portalRoot);
}
```

By solving this issue directly in the portal's source code, you are making it
more reliable and don't have to add extra boilerplate to your test setup.

[source](https://github.com/testing-library/react-testing-library/issues/62#issuecomment-438653348)
