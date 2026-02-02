# Specify Default For Data Definition

Here is what a `Data` definition for the concept of a `Permission` might look
like:

```ruby
Permission = Data.define(:id, :name, :description, :enabled)

perm1 = Permission.new(
  id: 123,
  name: :can_edit,
  description: "User is allowed to edit.",
  enabled: true
)
```

However, as we're creating various `Permission` entities, we may find that the
vast majority of them are _enabled_ by default and so we'd like to apply `true`
as a default value.

We cannot do this directly in the `Data` definition, but we can open a block to
override the `initialize` method.

```ruby
Permission = Data.define(:id, :name, :description, :enabled) do
  def initialize(:id, :name, :description, enabled: true)
    super
  end
end

perm1 = Permission.new(
  id: 123,
  name: :can_edit,
  description: "User is allowed to edit."
)

perm1.enabled #=> true
```

Now we're able to create a `Permission` without specifying the `enabled`
attribute and it takes on the default of `true`.

[source](https://dev.to/baweaver/new-in-ruby-32-datadefine-2819#comment-254o8)
