# Inspect Configuration Of Database Connection

There are a lot of factors that can effect the database configuration values.

- What are the settings in each environment in `config/database.yml`?
- Is there any dynamic ERB code in `config/database.yml`?
- Is `DATABASE_URL` set in the current environment?
- Is any other code overriding these settings?

To check the current _configuration hash_ for the database connection at
runtime, we can run the following statement:

```ruby
> ActiveRecord::Base.connection.pool.db_config.configuration_hash
=>
{:adapter=>"postgresql",
 :encoding=>"unicode",
 :host=>"::1",
 :user=>"postgres",
 :password=>"postgres",
 :pool=>5,
 :database=>"still_development",
 :port=>9875}
```

In this case, I'm running the statement from the Rails console of my app's
development environment.

I could even access and print these values as part of debugging in a production
environment with a rake task:

```ruby
# In lib/tasks/debug.rake
namespace :debug do
  task :db_config => :environment do
    puts "==== Database Configuration Debug ===="
    puts "DATABASE_URL: #{ENV['DATABASE_URL']}"
    puts "Active Record Config: #{ActiveRecord::Base.connection.pool.db_config.configuration_hash}"
    puts "Raw ENV dump:"
    ENV.sort.each { |k,v| puts "#{k}: #{v}" if k.include?('DB') || k.include?('DATABASE') }
  end
end
```

[source](https://api.rubyonrails.org/classes/ActiveRecord/DatabaseConfigurations/HashConfig.html)
