# Temporarily Disable strong_params

I was recently doing a Rails upgrade. This old version of the app wasn't
prepared to deal with `strong_params` right away. I already had a pile of
migration path TODOs and fixes on top of addressing the `strong_params` issue.
I decided to put off dealing with `strong_params` by adding this line the main
controller.

```ruby
# app/controllers/application_controller.rb
def params
  request.parameters
end
```

This bypasses the `strong_params` check for all controllers inheriting from
`ApplicationController`.

Remember, this is a _temporary_ fix. You'll eventually want to adhere to
`strong_params` for your mass assignments.

[source](https://stackoverflow.com/a/41163978/535590)
