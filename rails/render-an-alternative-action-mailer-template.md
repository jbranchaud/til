# Render An Alternative ActionMailer Template

The convention for Rails's ActionMailer is to render the view template that
corresponds to the mailer class's name and the specific action.

For instance, the `welcome_email` method in the `RegistrationMailer` class will
correspond to the `app/views/registration_mailer/welcome_email.html.erb` view.

This convention can be overridden. By passing, the `template_name` and
`template_path` arguments as options to the `mail` method, you can tell the
mailer to render a different template.

```ruby
class RegistrationMailer < ActionMailer::Base
  def welcome_email
    # mail setup ...

    mail(to: @user.email,
        subject: 'Welcome!',
        template_name: 'new_welcome')
  end
end
```

This will look for and use the
`app/views/registration_mailer/new_welcome.html.erb` template.

Also including the `template_path` option will alter the path to the named
template:

```ruby
class RegistrationMailer < ActionMailer::Base
  def welcome_email
    # mail setup ...

    mail(to: @user.email,
        subject: 'Welcome!',
        template_path: 'v2_mailer_templates',
        template_name: 'new_welcome')
  end
end
```

This will look for the `app/views/v2_mailer_templates/new_welcome.html.erb`
template.

[source](https://guides.rubyonrails.org/action_mailer_basics.html#mailer-views)
