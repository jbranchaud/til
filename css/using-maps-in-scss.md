# Using Maps In SCSS

You can collect a set of like values into a
[map](https://sass-lang.com/documentation/values/maps) with the following SCSS
syntax:

```scss
$backgrounds: (
  "gray": #AAAAAA,
  "red": #FF4136,
  "blue": #0074D9,
);
```

You can then access a value from the map using the [`map-get`
function](https://sass-lang.com/documentation/values/maps#look-up-a-value):

```scss
.boxA {
  background-color: map-get($backgrounds, "gray");
}

.boxB {
  background-color: map-get($backgrounds, "red");
}

.boxC {
  background-color: map-get($backgrounds, "blue");
}
```

See a [live example here](https://codepen.io/jbranchaud/pen/WVJrgp).
