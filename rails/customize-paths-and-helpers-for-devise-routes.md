# Customize Paths And Helpers For Devise Routes

Wih a default Devise setup (`devise_for :users`), the sign up/in/out routes are
located at `/users/sign_up`, `/users/sign_in`, and `/users/sign_out`. And the
path helpers are `new_user_registration_path`, `new_user_session_path`, and
`destroy_user_session_path`, respectively.

These can be customized in `config/routes.rb` by opening up the `devise_scope
:user` block and re-specifying the routes of interest.

```ruby
Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
    get 'sign_in', to: 'devise/sessions#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
  end
end
```

These three custom routes override the paths and helps I described above like
so:

- `sign_up_path` -> `/sign_up`
- `sign_in_path` -> `/sign_in`
- `sign_out_path` -> `/sign_out`

I find these path helpers easier to work with and I like the UX of
registration/session paths not nested under `/user`.
