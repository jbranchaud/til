# Filter By Truthy Values With Boolean Function

The `Boolean` function (not to be confused with the `Boolean` constructor)
evaluates any given value to its [boolean
coercion](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean#boolean_coercion).

```javascript
> Boolean(0)
false
> Boolean(1)
true
> Boolean(null)
false
> Boolean([])
true
```

One way that this can be put to use is as a _boolean identity function_ for
passing to other functions like `filter`.

```javascript
> [0, 1, "", [], "four", null, "six", undefined, 7].filter(Boolean)
[ 1, [], 'four', 'six', 7 ]
```

This filters out all the non-truthy values from a list.

Let's say I'm building a list of nav items that will be rendered to the UI for a
specific user. Based on permissions or feature flags, certain nav items may not
be available. Those "empty" entries can be filtered out in this way.

```javascript
nav_items = [
  { label: "Home", href: "/" },
  isSystemAdmin && { label: "System", "/system" },
  featureEnabled(user, "api") && { label: "API", "/api" },
].filter(Boolean)
```

If any of those conditional nav items evaluate to `false`, then they will be
filtered out. The resulting `nav_items` array is a clean list of actual nav
items I want to render.
