# Use dotenv In A Non-Rails Project

Up to now I've only used [`dotenv`](https://github.com/bkeepers/dotenv) in a
Rails context. It can just as easily be used in a plain old Ruby project.

Install the non-Rails version of the gem.

```bash
$ gem install dotenv
```

Then add the following lines wherever you want `dotenv` included and loaded.
In my case, I want it pulled in as part of my RSpec setup in
`spec_helper.rb`.

```ruby
require 'dotenv'
Dotenv.load
```

Your environment variables declared in `.env` are now accessible via fetches
against the `ENV` object.

```ruby
ENV.fetch('my_env_var')
```
