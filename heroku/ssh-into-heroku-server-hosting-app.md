# SSH Into Heroku Server Hosting App

Heroku hosts and deploys your app on a remote server. One of Heroku's primary
offerings is that it abstracts away the details of that server. You generally
don't need to think about it. Instead you can use the Heroku CLI to interact
with it indirectly.

There will inevitably be a time when you need to access that server directly.
Heroku gives you a way to do this with their CLI through
[`ps:exec`](https://devcenter.heroku.com/articles/exec).

```bash
$ heroku ps:exec --app my-app
```

This will connect you to an SSH session with the server that the app is running
on.
