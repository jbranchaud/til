# Sorting Arrays Of Objects With Lodash

The [`lodash`](https://lodash.com/) library comes with a couple functions for
sorting collections of objects --
[`sortBy`](https://lodash.com/docs/4.17.15#sortBy) and
[`orderBy`](https://lodash.com/docs/4.17.15#orderBy).

Consider the following collection of pokemon:

```javascript
const pokemon = [
  { name: "Pikachu", level: 12 },
  { name: "Charmander", level: 12 },
  { name: "Squirtle", level: 15 },
  { name: "Bulbasaur", level: 11 }
];
```

This collection can be sorted in ascending order by the value of a key in the
object using `sortBy`.

```javascript
import _sortBy from "lodash/sortBy";

_sortBy(pokemon, ["level"]);
```

If you want to control whether the sorting is in ascending or descending order,
use `orderBy`.

```javascript
import _orderBy from "lodash/orderBy";

_orderBy(pokemon, ["level"], ["desc"]);
```

You can also do sorting with primary and secondary keys by including two values
in the key sort array.

```javascript
import _sortBy from "lodash/sortBy";

_sortBy(pokemon, ["name", "level"]);
```

And if you want to indpendently control ascending/descending for these as well,
you can.

```javascript
import _orderBy from "lodash/orderBy";

_orderBy(pokemon, ["level", "name"], ["desc", "asc"]);
```

Check out the [live example](https://codesandbox.io/s/jolly-ardinghelli-cem7t)
to see it in action.
