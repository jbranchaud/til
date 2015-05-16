# Push Non-master Branch To Heroku

When using git to deploy your app to Heroku, it is expected that you push
to the `master` branch. When you run the following command

```
$ git push heroku master
```

Heroku will attempt to build and run your app. However, if you have a
`staging` branch for your application that you want to push to your
staging environment on Heroku, you cannot simply run

```
$ git push heroku staging
```

Heroku will only perform a build on pushes to the remote `master` branch.
You can get around this, though, by specifying that your `staging` branch
should be pushed to the remote `master` branch, like so

```
$ git push heroku staging:master
```

[source](https://coderwall.com/p/1xforw/make-heroku-run-a-non-master-branch)
