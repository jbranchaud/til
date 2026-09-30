# Ask An Agent To Fix Merge Conflicts

I work across a lot of different branches as part of a busy software team that
is doing the same. As I'm integrating feature branches into the `staging` branch
or rebasing the latest from `main` onto my feature branch, I often run into
merge conflicts. I find that frontier models are fast and accurate at fixing
merge conflicts. They quickly look at commit context on both sides of the merge,
figure out how the changes fit together, remove conflict markers, and run
targeted parts of the test suite as needed.

My workflow for a long time tended to be opening a fresh `claude` session and
then typing the words "Can you fix the merge conflict?" and letting the agent do
its thing.

I've shaved some of the friction from that process by turning it into a
one-liner that will show up in my shell history.

```bash
❯ claude -p "Can you fix the merge conflict?" --permission-mode auto

I fixed the merge conflicts in all 3 files and staged them. I haven't committed.
The two email-campaign test files (model and controller) pass: 64 runs, 0
failures.

The main thing: staging (HEAD) has already removed the old content columns from
`email_campaigns`. So where your branch's changes assumed those columns still
existed, I kept staging's version.

- **`app/models/email_campaign.rb`**: kept staging's comment, which says
`email_campaigns` has no content columns. Your branch's change to
`body_well_formed`, which uses `content_attribute_changed?`, merged in without
conflict and is kept.
- **`app/models/email_campaign/revisable.rb`**: kept staging's comment. I also
removed the `self.ignored_columns += REVISABLE_ATTRIBUTES...` line your branch
added, since the columns it hides no longer exist.
- **`test/models/email_campaign_test.rb`**: kept your branch's version. That
drops staging's "an edit that rewrites the body validates it" test: its checks
are the same as your branch's "an edit that changes the body validates it", and
its comment is about `body_changed?`, which is out of date now.

To finish the merge, run `git commit`.
```

The way this command works is that `-p "..."` specifies the prompt which is the
part I found myself typing out every single time. And then the
`--permission-mode auto` is important for invoking `claude` not in the
_interactive_ mode because it needs to be able to run without prompting you for
permission to inspect git things, edit files, and run tests.
