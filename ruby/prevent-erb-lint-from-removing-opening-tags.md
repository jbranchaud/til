# Prevent erb_lint From Removing Opening Tags

The [`erb_lint` gem](https://github.com/Shopify/erb_lint) is a tool from
shopify for linting and auto-formatting ERB files. When I first set it up in a
Rails codebase with the base `.erb-lint.yml` recommended in the README, I ran
into a pernicious issue. The linter wanted to remove opening tags (i.e. `<%`
and `<%=`) from my ERB files.

So, for a file that looked like this:

```erb
<div>
  <%= form_with(url: login_path, scope: :session) do |f| %>
    <div>
      <%= f.label :email %>
      <%= f.email_field :email %>
    </div>
</div>
```

It would get formatted to this:

```erb
<div>
form_with(url: login_path, scope: :session) do |f| %>
    <div>
f.label :email %>
f.email_field :email %>
    </div>
</div>
```

Yikes!

I had to disable a couple rules (under `rubocop_config:`) in the `.erb-lint.yml` file to get it to stop
doing this.

```yaml
Layout/InitialIndentation:
  Enabled: false
Layout/TrailingEmptyLines:
  Enabled: false
```

[source](https://github.com/Shopify/erb_lint/issues/222)
