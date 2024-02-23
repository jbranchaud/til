# Alter The Rails Setup Script

When you generate a new Rails app, a set of scripts are put in the `bin/`
folder of your new app. These _bin scripts_ are ruby scripts that you can use
to run `rails` commands, `rake` commands, as well as `setup` your rails
project.

These scripts can be modified like you'd modify any other ruby code.

In fact, the `setup` scripts encourages you to modify it by providing an
example of an additional setup step you can add.

```bash
#!/usr/bin/env ruby
require "fileutils"

# ...

FileUtils.chdir APP_ROOT do
  # This script is a way to set up or update your development environment automatically.
  # This script is idempotent, so that you can run it at any time and get an expectable outcome.
  # Add necessary setup steps to this file.

  puts "\n== Installing dependencies =="
  system! "gem install bundler --conservative"
  system("bundle check") || system!("bundle install")

  # puts "\n== Copying sample files =="
  # unless File.exist?("config/database.yml")
  #   FileUtils.cp "config/database.yml.sample", "config/database.yml"
  # end

  # ...
end
```

There are several steps built in, but it provides an example of how you can
copy a sample YAML file to be the actual version of that YAML file.
