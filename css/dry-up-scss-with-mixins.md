# Dry Up SCSS With Mixins

If you have a similar chunk of styling that is being duplicated across your
CSS, you'd probably like to dry it up to reduce the pain of maintaining it.
Mixins provide one way of dealing with this problem.

First, declare a named mixin of the styles that you are trying to dry up.

```css
@mixin navigation {
  nav {
    display: flex;
    justify-content: space-around;

    ul {
      list-style: none;

      li a {
        text-decoration: none;
      }
    }
  }
}
```

Then, this mixin can be _included_ wherever it is needed.

```css
div.base-nav {
  @include navgation;
  background-color: #fff;
  color: #444;

  nav ul {
    li a:hover {
      color: #222;
    }
  }
}

div.admin-nav {
  @include navgation;
  background-color: #000;
  color: #fff;

  nav ul {
    li a:hover {
      color: #ddd;
    }
  }
}
```

Any subsequent changes to the core navigation styling only need to be made
in one place, the mixin.

[source](http://sass-lang.com/guide)

h/t Dorian Karter
