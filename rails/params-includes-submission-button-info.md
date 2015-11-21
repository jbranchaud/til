# Params Includes Submission Button Info

When a form is submitted for a Rails app, the respective controller action
will have access to a variety of information in the `params` hash. Included
is an entry with the name and value of the button that submitted the form.
By default, Rails will give the name `commit` to a submission button.

```
<%= f.submit %>
# results in:
<input type="submit" name="commit" value="Submit">Submit</input>
```

The corresponding `create` action will have parameters that include that
submission button's info:

```ruby
# in create action
> params['commit']
=> 'Submit'
```

This is useful when you have multiple buttons that submit the same form, but
should have slightly different results in the corresponding action.
Differentiating becomes easy when you can easily check which was used to
submit the form. No javascript required.
