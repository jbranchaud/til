# Deploy A Review App To A Different Stack

Heroku has different stacks for deploying apps. As newer versions of Linux
distros (such as Ubuntu) come out and software packages need patching and
updating, Heroku releases new stacks. And deprecates older ones.

Before upgrading a production app to a new stack, you should test it out first.
The recommended way to test this out is with a Review App.

If you need to bump the Ruby version or make any other changes, do that first.

Then add or update your `app.json` file. This is a Heroku-specific file that
tells Heroku what stack to use when creating a new app or review app.

```json
{
  "stack": "heroku-18"
}
```

Let's say my app is currently on the Heroku-16 stack. I can set the `stack` to
be `heroku-18` in `app.json`. Then I can push up a branch with all these
changes and turn it into a PR. From the Heroku dashboard, I can click the
Heroku Button that builds a Review App from the PR.

Once it it finishes building and deploying, Heroku will give me a custom URL
for visiting the app so that I can manually evaluate it.

[source](https://devcenter.heroku.com/articles/upgrading-to-the-latest-stack#testing-an-app-on-a-new-stack)
