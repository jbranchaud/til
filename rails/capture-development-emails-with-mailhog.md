# Capture Development Emails With Mailhog

My preferred way to capture and view emails being sent by a Rails app in
development is to use [MailHog](https://github.com/mailhog/MailHog). It runs a
local SMTP server at port `1025` and a barebones email client at port `8025`.

The `mailhog` utility can be installed with `brew`:

```bash
$ brew install mailhog
```

The development `smtp` settings are configured in
`config/environments/development.rb`:

```ruby
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'localhost',
    port: 1025,
  }
```

Then start running `mailhog` with its default settings:

```bash
$ mailhog
```

All outgoing email from the development server will be captured and viewable in
both `html` and `text` form at `localhost:8025`.
