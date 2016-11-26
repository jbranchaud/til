# Virtual Fields With Ecto Schemas

If you'd like to include a particular key-value pair in an Ecto changeset,
it needs to be included as a field in the schema. In the case of something
akin to a password field, you want to be able to perform validations against
it, but the password itself does not have a column in the database. In other
words, you want to use the password in memory as part of the validation
process but not save it to the database. To accomplish this, you need to
specify that it is a `virtual` field.

```elixir
schema "users" do
  field :username, :string
  field :password_digest, :string
  field :password, :string, virtual: true
end
```

With that schema, you can then validate the `:password` and transform it
into the corresponding `:password_digest` field.

```elixir
def registration_changeset(model, params) do
  model
  |> changeset(params)                  # do other standard validations
  |> cast(params, [:password])          # include :password in the changeset
  |> validate_length(:password, min: 8) # validations
  |> put_pass_hash()                    # transform into :password_digest
end
```
