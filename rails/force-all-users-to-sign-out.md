# Force All Users To Sign Out

If you are using cookie-based authentication and you want to sign out all users
(so that they have to re-authenticate), you need to invalidate all of the
cookies.

Because the cookies live in the client's browser, you cannot simply clear them
like you would with session-based authentication. Instead, you need to replace
the session token used to create all those cookies.

First, get a new token:

```bash
$ bundle exec rake secret
538696c1399ff182486e09980ba915d098b8fb23a3ace42c3eea0ab51b18fdff7895cd620f32b263d10d25c2fdba16647f4d8632e9032eccef7406e1ad9cba09
```

Then, replace the current `secret_key_base` value with that new secret token
[wherever it is
stored](https://api.rubyonrails.org/classes/Rails/Application.html#method-i-secret_key_base)
in the production environment.

[source](https://stackoverflow.com/questions/35190591/rails-4-devise-how-to-log-out-all-users)
