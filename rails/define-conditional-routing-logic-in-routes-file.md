# Define Conditional Routing Logic In Routes File

I ran into a situation recently where I needed to intercept the behavior a
common public-facing route in an app. Broadly, the route is for company specific
rental pages with query parameters that correspond to their available inventory.

What I needed was a way to display a demo version of that rental page ignoring
everything else about how the request would otherwise be processed, validated,
and rendered.

Instead of introducing a bunch of weird conditional logic into this already
complex rental controller, I was able to intercept the request at the routing
layer when `demo=true` is set and send it to a different controller.

Here is what that section of `config/routes.rb` looks like:

```ruby
get "rentals/new", to: "rental_demos#show",
  as: :rental_demo,
  constraints: ->(request) { request.params[:demo] == "true" }

resources :rentals, only: %i[new create] do
  # ...
end
```

This specifies a `constraint` on the `get` handler matching for a given request.
If the constraint isn't met, then the route handling logic proceeds where it
will instead find a match with the original new rentals resource routing.

Now I can reference a version of this URL that includes `demo=true` as a way of
having an always-available realistic-looking version of the rental page even if
one of these companies doesn't actively have available inventory.

Those requests will get intercepted by the first matching route handler which
will send them to the `RentalDemosController` instead of the
`RentalsController`.
