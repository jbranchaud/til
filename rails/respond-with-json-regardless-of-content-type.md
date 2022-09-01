# Respond With JSON Regardless Of Content Type

Let's say you want to serve some JSON from an endpoint (for example, you might
be serving [the `apple-app-site-association` file for iOS Universal
Links](https://developer.apple.com/documentation/xcode/supporting-associated-domains)).
Regardless of whether the endpoint is requested as JSON (`application/json`),
HTML (`text/html`), or something else (`plain/text`), you want to respond with
JSON.

The [`format#any`
method](https://api.rubyonrails.org/classes/ActionController/MimeResponds.html)
can be used when defining the `respond_to` block. This tells the controller
that _any_ mimetype is accepted.

```ruby
def show
  respond_to do |format|
    format.any do
      render params[:page],
        formats: 'json',
        content_type: "application/json",
        layout: false
    end
  end
end
```

The other important element in this is `formats: 'json'` which helps Rails find
your `<template_name>.json.erb` file in the `views` directory.

Though I cannot find any documentation for it, `format.all` appears to work the
same as `format.any` as described in the above example.

h/t Dillon Hafer
