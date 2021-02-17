# Set The Default Development Port

For Rails 5+, Puma has been the default web server that gets installed with new
Rails apps. Puma comes with some configuration in the `config/puma.rb` file.

If you open that file up, you'll see a number of settings that can be
configured. One of them is the `port` that `puma` uses.

```ruby
# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#
port        ENV.fetch('PORT') { 3000 }
```

It looks for a `PORT` value in the envionrment and uses that if it is present.
That means you could run:

```bash
PORT=5005 rails s
```

and Puma would server the local development server at `localhost:5005`. If that
value is not present, it will fallback to `#fetch`'s block which contains
`3000`.

If you always want to local Rails development server to run at a port other
than `3000`, all you need to do is update that line.

```ruby
port        ENV.fetch('PORT') { 5005 }
```

Now, running `rails s` on its own will start the dev server up at
`localhost:5005`.

[source](https://schneems.com/2017/03/13/puma-ports-and-polish/)
