# Lighten And Darken With SCSS

With SCSS, a color can be lightened or darkened by a certain percentage
using the
[`lighten`](http://sass-lang.com/documentation/Sass/Script/Functions.html#lighten-instance_method)
and
[`darken`](http://sass-lang.com/documentation/Sass/Script/Functions.html#darken-instance_method)
functions, respectively.

For instance, given the following HTML

```html
<div class='one'></div>
<div class='two'></div>
<div class='three'></div>
```

I can style `div.two` with the original color and then style `div.one` with
a lightened version and `div.three` with a darkened version.

```scss
$box-color: #0074d9;

.two {
  background: $box-color;
}
.one {
  background: lighten($box-color, 20%);
}
.three {
  background: darken($box-color, 20%);
}
```

The result looks something like this:

![](http://i.imgur.com/SaeTL8H.png)
