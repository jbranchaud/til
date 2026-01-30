# Check How Database Is Configured

While making some adjustments to the database connection string (`DATABASE_URL`)
for a pre-production Rails environment, we wanted to check that configuration
options like `sslmode` were picked up.

From a `rails console` session I can check the live database configuration like
so:

```ruby
> ActiveRecord::Base.connection_db_config.configuration_hash
=> {
  adapter: "postgresql",
  encoding: "unicode",
  pool: 5,
  database: "my_app_development"
}
```

I can look at the
[`configuration_hash`](https://api.rubyonrails.org/classes/ActiveRecord/DatabaseConfigurations/HashConfig.html#attribute-i-configuration_hash)
from `rails console` of my pre-prod environment to see more configuration
settings:

```ruby
> ActiveRecord::Base.connection_db_config.configuration_hash
=> {
  adapter: "postgresql",
  encoding: "unicode",
  pool: 5,
  username: "app_user",
  password: "super_s3cr3t",
  port: 15432,
  database: "pre_prod_database",
  host: "some-host-123.ondigitalocean.com",
  sslmode: "verify-full"
}
```

Since I was specifically looking for the `sslmode` value, I can access that
directly:

```ruby
> ActiveRecord::Base.connection_db_config.configuration_hash[:sslmode]
=> "verify-full"
```
