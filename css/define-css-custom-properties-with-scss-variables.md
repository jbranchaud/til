# Define CSS Custom Properties With SCSS Variables

It doesn't work to directly declare a CSS custom property using SCSS variables
like this:

```css
$primary-action: #057A5B;

.btn-primary {
  --button-color: $primary-action;
}
```

After SCSS pre-processing, the resulting CSS will look like this:

```css
.btn-primary {
  --button-color: $primary-action;
}
```

Instead of the variable being translated into its declared value (`#057A5B` in
this case), it is left as is.

This is because CSS custom property syntax is unusual enough that it gets
processed literally. The only way to incorporate a variable is with
_interpolation_.

```css
$primary-action: #057A5B;

.btn-primary {
  --button-color: #{$primary-action};
}
```

Wrapping the SCSS variable in interpolation syntax (`#{ ... }`) will do the
job.

[source](https://sass-lang.com/documentation/style-rules/declarations#custom-properties)
