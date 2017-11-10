# Parameterized SCSS Mixins

A mixin can be made to be much more versatile by parameterizing it. If you
need variations of a block of CSS, then move the parts that vary out into
parameters to the mixin.

```css
@mixin navigation($background-color, $color, $link-color) {
  nav {
    display: flex;
    justify-content: space-around;
    background-color: $background-color;
    color: $color;

    ul {
      list-style: none;

      li a {
        text-decoration: none;
        color: $link-color;
      }
    }
  }
}

div.base-nav {
  @include navgation(#fff, #444, #222);
}

div.admin-nav {
  @include navgation(#000, #fff, #ddd);
}
```

The mixin can now easily be used to customize different segments of your
app's styling.
