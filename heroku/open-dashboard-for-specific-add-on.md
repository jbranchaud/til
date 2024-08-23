# Open Dashboard For Specific Add-On

The number of times I've needed to check the papertrail logs for my
Heroku-hosted Rails app is a lot. I open a browser tab, go through several
layers of navigation to get to my app's dashboard, and then click the
papertrail link under _Add-ons_.

There is a much quicker way using the Heroku CLI.

```bash
$ heroku addons:open papertrail -a my-app-name
Opening https://addons-sso.heroku.com/apps/abc123/addons/efg456...
```

It sends you to an add-ons SSO link in the browser which authenticates you and
drops you into the dashboard for that specific add-on. You just need to specify
the add-on name and the app name.
