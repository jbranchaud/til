# Monitor Usage Limits From CLI

When I first started using Claude Code enough to push the usage limits, I would
periodically switch over to the browser to check
`https://claude.ai/settings/usage` to see how close I was getting. That page
would tell me what percentage of my allotted usage I had consumed so far for the
current 5-hour session and then how long until that 5-hour usage window resets.

This can also be viewed directly in Claude Code for the CLI.

First, run the `/status` slash command and then _tab_ over to the _Usage_
section. There you will see the same details as in the web view.

I'm also learned, as I write this, that you can go directly to the _Usage_
section by typing the `/usage` slash command.

See [the docs](https://code.claude.com/docs/en/slash-commands) for a listing of
all slash commands.
