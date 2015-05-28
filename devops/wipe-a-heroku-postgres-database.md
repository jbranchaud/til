# Wipe A Heroku Postgres Database

If you have some sort of non-production version of an application running on
Heroku, you may encounter a time when you need to wipe your database and
start fresh. For a rails project, it may be tempting to do `heroku run rake
db:drop db:setup`. Heroku doesn't want you to accidentally do anything
stupid, so it prevents you from running `rake db:drop`. Instead, you must
send a more explicit command

```
$ heroku pg:reset DATABASE_URL
```

Heroku will ask you to confirm that you indeed want to wipe out the database
and will then proceed.

For the curious reader, running `heroku config` will list the values of a
number of variables including `DATABASE_URL`.
