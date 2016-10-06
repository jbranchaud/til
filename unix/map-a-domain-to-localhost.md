# Map A Domain To localhost

Do you want your computer to treat a domain as `localhost`? You can map it
as such in your `/etc/hosts` file. For example, if I have an web app that
refers to itself with the `dev.app.com` domain, I can add the following line
to my `/etc/hosts` file to make sure the domain resolves to `localhost`:

```
127.0.0.1 dev.app.com
```

Now, if I pop open my browser and visit `dev.app.com:3000`, I will see
whatever is being served to `localhost:3000`.

h/t Chris Erin
