# Ensure A Rake Task Cannot Write Data

Let's say we are writing a substantially complex rake task for aggregating,
arranging, and exporting data from our app's database. The idea is to run this
rake task against production.

There is no part of this rake task that needs to write data. It should act as a
read-only script. And in fact, we can ensure it isn't able to write any data.
We can do that by putting `ApplicationRecord` in read-only mode.

```ruby
task big_export_rake_task: :environment do
  class ApplicationRecord
    def readonly?
      true
    end
  end

  # a bunch of logic ...
  puts 'this gets executed'

  # Call method that inadvertently writes data
  User.update(email: 'readonly@email.com')

  # more logic ...
  puts 'this does not get executed'
end
```

Because we have made all of `ApplicationRecord` read-only, when we run this
task, it is immediately going to rollback the changes that were attempted and
then raise an error which aborts the rest of the rake task.

We'll see some messaging like this:

```
rake aborted!
ActiveRecord::ReadOnlyRecord: User is marked as readonly
```

h/t [Dillon Hafer](https://dillonhafer.com/)
