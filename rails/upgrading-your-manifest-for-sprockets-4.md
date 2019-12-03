# Upgrading Your Manifest For Sprocket's 4

If you're upgrading [Rails](https://github.com/rails/rails) and it involves
bumping the [Sprockets](https://github.com/rails/sprockets) dependency from 3.x
to 4.x, you may need to update your `manifest.js`.

> Since the default logic for determining top-level targets changed, you might
> find some files that were currently compiled by sprockets for delivery to
> browser no longer are. You will have to edit the `manifest.js` to specify
> those files.

> The `manifest.js` file is meant to specify what files to use as a top-level
> target using sprockets methods `link`, `link_directory`, and `link_tree`.

You can specify what top-level assets like so:

```javascript
# app/assets/config/manifest.js

//= link_tree ../images
//= link_directory ../javascripts .js
//= link_directory ../stylesheets .css
//= link some_file.xml
//= link some/nested/style.css
```

Read more about the [upgrade process
here](https://github.com/rails/sprockets/blob/master/UPGRADING.md#manifestjs)
as well as in [this blog
post](https://eileencodes.com/posts/the-sprockets-4-manifest/).
