# Flipper Discards Actors When Feature Fully Enabled

Let's say I have a [Flipper feature flag](https://github.com/flippercloud/flipper) that I have enabled for a handful
of users. When I eventully go to globally enable that feature flag with the big
green 'Enable' button, the gate short-circuit evalutes to true everywhere. This
is what grants access to anyone when it is enabled.

There is another thing that happens under the hood when the switch is flipped.
All those individual actor records I created for that feature flag get wiped
out.

In the ideal case, that's not an issue because the flag is fully on going
forward. But what about the scenario where I need to rollback the feature
release.

What if I'm thinking, "whoops, my team isn't ready to handle the influx of users
for this feature, I want to go back to having it partially enabled for that
small list of users for now."

I'll be out of luck because that list of _actors_ was cleared. So if I'm
anticipating that I might want to be able to rollback in that way, I should
capture a snapshot of the set of actors I had enabled for that feature.

```ruby
actors = Flipper[:some_feature].actors_value.to_a
puts JSON.pretty_generate(actors)
```

I could then iterate through that list making calls to individually enable it
for each actor:

```ruby
Flipper.enable_actor(:some_feature, Flipper::Actor.new(flipper_id))
```

I give a full example of what that script could look like in [Rollback a Flipper Feature Flag Release](https://www.visualmode.dev/rollback-a-flipper-feature-flag-release).
