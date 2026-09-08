# Use Claude Code From Multiple Accounts

When I first start using Claude Code (`claude`) from the CLI, it will by default
use the `~/.claude` directory for settings, authentication, memory, sessions,
etc. This works fine as long as I'm working from a single, personal Claude
subscription. If I am juggling multiple subscriptions, there is not an obvious
way to switch between them.

A client I work with recently invited me to their Claude Team subscription via a
company email. I needed a way to access `claude` both from my existing
subscription, for other projects and work, while also doing stuff specific to
this client from the team account. Constantly logging in and out sure doesn't
feel like a sustainable solution.

The solution was to make use of the `CLAUDE_CONFIG_DIR` environment variable.

I first make a new config directory for Claude that is specific to this client.

```bash
❯ mkdir -p ~/.claude-client-x
```

Then, from the project directory for this client (e.g.
`~/dev/clients/client-x/codebase`), I start a `claude` session pointing at this
new, empty directory.

```bash
❯ CLAUDE_CONFIG_DIR="~/.claude-client-x" claude
```

I'm prompted with a couple settings and config questions since this is a blank
slate `claude` session. Then I need to do a fresh authentication with `/login`.
For me, this involved authenticating in a separate Chrome profile where this
secondary Claude Team subscription was already active.

Lastly, I need to make sure that I use the correct "credentials"
whenever I'm starting a `claude` session. That means pointing `claude` to the
correct _config dir_. I tend to use `mise` or `direnv` across all my projects.
For any projects that pertain to _Client X_, I add the following to my
environment (i.e. `mise.local.toml`):

```
[env]
CLAUDE_CONFIG_DIR = "~/.claude-client-x"
```

Now, whenever I run `claude` from that project, it will use that specific config
in `~/.claude-client-x`.

Pretty much everywhere else on my machine that I'm using `claude`, I want to use
the account that is already signed in at the default config dir, so no other
change is needed there.
