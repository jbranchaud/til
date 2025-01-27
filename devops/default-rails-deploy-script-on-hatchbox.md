# Default Rails Deploy Script On Hatchbox

I deployed a Rails app to [Hatchbox](https://hatchbox.io) recently. When
following along in the log during a deploy, I can see most of what is happening
as part of the deploy. Though it is too verbose to look through every line. I'd
rather see the contents of the deploy script.

I did quite a bit of digging around while SSH'd into my hatchbox server, but I
couldn't find if or where that file might be stored.

Instead, there is a [_Help Center_
article](https://hatchbox.relationkit.io/articles/55-what-is-the-default-rails-deploy-script)
where Chris Oliver shares what is in the script.

```bash
bundle install -j $(nproc)
yarn install
bundle exec rails assets:precompile
[[ -n "${CRON}" ]] && bundle exec rails db:migrate
```

It does a parallelized `bundle install`, then a `yarn install` (make sure your
project is using `yarn.lock`), Rails asset precompilation, and then if `CRON`
is set (Cron role is available by checking _Cron_ under _Server
Responsibilities_ for your Hatchbox server), it will run Rails migrations.

From app settings, the deploy script can be overridden, or pre- and post-deploy
steps can be added.
