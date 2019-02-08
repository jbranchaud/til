# Serialize With fast_jsonapi In A Rails App

Netflix put out a Ruby gem for super fast JSON serialization --
[`fast_jsonapi`](https://github.com/Netflix/fast_jsonapi). It is great for
serializing JSON responses for Rails API endpoints.

First, add `gem 'fast_jsonapi'` to your `Gemfile` and `bundle install`.

Then create the `app/serializers` directory for housing all of your JSON
serializers.

Next you can create a `serializer` that corresponds to the model you want to
serialize:

```ruby
# app/serializers/recipe_serializer.rb
class RecipeSerializer
  include FastJsonapi::ObjectSerializer

  set_id :id
  attributes :name, :source_url
end
```

Last, use it to generate a JSON response in your controller:

```ruby
# app/controllers/recipes_controller.rb
class RecipesController < ApiController
  def index
    render json: RecipeSerializer.new(@current_user.recipes)
  end
end
```

Requests to that endpoint will receive a response that looks something like
this:

```json
{
  data: [
    {
      id: 1,
      attributes: { name: "Old Fashioned", source_url: "http://..." },
    },
    {
      id: 2,
      attributes: { name: "Sazerac", source_url: "http://..." },
    },
  ]
}
```
