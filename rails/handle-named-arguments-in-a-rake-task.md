# Handle Named Arguments In A Rake Task

There are [a number of
ways](https://www.seancdavis.com/blog/4-ways-to-pass-arguments-to-a-rake-task/)
to pass arguments into a Rake task. The standard approach only allows for
positional arguments. When I need named and optional arguments, my preferred
approach is to use environment variables.

Here is a skimmed down version of a user lookup task. Notice the task
definition itself doesn't include any arguments. Instead, a couple optional
values are extracted from the environment (`ENV`) at the beginngin of the task.

```ruby
desc "An example task with named, optional arguments"
task :lookup_user => :environment do
  user_id = ENV['USER_ID']
  email = ENV['EMAIL']

  if user_id.present?
    user = User.find(user_id)

    if user.blank?
      puts "No user for id ##{user_id}"
    end
  elsif email.present?
    user = User.find_by(email: email)

    if user.blank?
      puts "No user for email #{email}"
    end
  end

  puts "User found" if user.present?
end
```

This task can be invoked in the following ways:

```bash
$ rake lookup_user USER_ID=123
```

```bash
$ rake lookup_user EMAIL="user@example.com"
```

or even with both arguments included, in which case the task has been written
to give precedence to `USER_ID`:

```bash
$ rake lookup_user EMAIL="user@example.com" USER_ID=123
```
