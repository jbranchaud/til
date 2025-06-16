# Provide Fake Form Helper To Controllers

I'm rendering a partial from a turbo stream. The partial is meant to be
rendered within a Rails form object because it contains an input element that
needs to reference the form object. The problem is that from the controller
that is streaming the partial, there is no
[FormBuilder](https://api.rubyonrails.org/v6.1.0/classes/ActionView/Helpers/FormBuilder.html)
object.

One way to get around this that I've borrowed from [Justin
Searls](https://justin.searls.co/posts/instantiate-a-custom-rails-formbuilder-without-using-form_with/)
is with a `FauxFormHelper`.

```ruby
module FauxFormHelper
  FauxFormObject = Struct.new do
    def errors
    end

    def method_missing(...)
    end

    def respond_to_missing?(...)
      true
    end
  end

  def faux_form
    @faux_form ||= ActionView::Helpers::FormBuilder.new(
      nil,
      FauxFormObject.new,
      self,
      {}
    )
  end
end
```

This module defines and exposes a `faux_form` object that controllers and views
can access. Then my partial can recieve that form object as a parameter.
