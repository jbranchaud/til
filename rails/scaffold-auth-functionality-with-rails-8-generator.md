# Scaffold Auth Functionality With Rails 8 Generator

Rails 8 added a built-in generator for authentication that scaffolds the core
models, controllers, views, routes, etc. needed for a basic email/password
authentication flow. It creates a `User` model, if one doesn't already exist,
as the authenticated object. It uses the `bcrypt` gem for password hashing,
etc.

Here is an example of what you get when running the generator on a relatively
new Rails 8 project:

```bash
$ bin/rails generate authentication
      invoke  tailwindcss
      create    app/views/passwords/new.html.erb
      create    app/views/passwords/edit.html.erb
      create    app/views/sessions/new.html.erb
      create  app/models/session.rb
      create  app/models/user.rb
      create  app/models/current.rb
      create  app/controllers/sessions_controller.rb
      create  app/controllers/concerns/authentication.rb
      create  app/controllers/passwords_controller.rb
      create  app/channels/application_cable/connection.rb
      create  app/mailers/passwords_mailer.rb
      create  app/views/passwords_mailer/reset.html.erb
      create  app/views/passwords_mailer/reset.text.erb
      create  test/mailers/previews/passwords_mailer_preview.rb
      insert  app/controllers/application_controller.rb
       route  resources :passwords, param: :token
       route  resource :session
        gsub  Gemfile
      bundle  install --quiet
    generate  migration CreateUsers email_address:string!:uniq password_digest:string! --force
       rails  generate migration CreateUsers email_address:string!:uniq password_digest:string! --force
      invoke  active_record
      create    db/migrate/20250115224625_create_users.rb
    generate  migration CreateSessions user:references ip_address:string user_agent:string --force
       rails  generate migration CreateSessions user:references ip_address:string user_agent:string --force
      invoke  active_record
      create    db/migrate/20250115224626_create_sessions.rb
```

[source](https://www.bigbinary.com/blog/rails-8-introduces-a-basic-authentication-generator)
