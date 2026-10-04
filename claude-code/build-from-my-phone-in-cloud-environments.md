# Build From My Phone In Cloud Environments

I mostly use Claude Code from a terminal with the `claude` CLI. Everything is
running on my machine (except the inference). The codebase is already there, the
feature branch is already in flight, all my tools and dotfiles are installed,
the dev server or container VMs are running, etc. It's the closest to how I
already worked before coding harnesses and allows me to seamlessly flow between
agentic code, review, making my own edits, and so forth.

However, I've been finding it pretty satisfying to open _Claude Code_ either in
the MacOS app or iOS app, connect a GitHub repo, and then ask for a quick
feature landed as a PR.

This flow uses [Claude in the Cloud](https://code.claude.com/docs/en/claude-code-on-the-web) to boot up a
development environment, pull down your codebase, create a branch, build a
feature, run tests, boot the app, do all the different explorations and checks
that `claude` typically does, and eventually land a PR back on GitHub.

What I find particularly remarkable about this flow is that this _cloud session_
is effectively synced across any device where I'm using Claude. So while I'm on
the train home from the gym, I open the Claude iOS app, pick my repo, and
describe a feature. By the time I get home, I open Claude.app on my computer
where I can skim through the chat summary, view the diff, and then suggest next
steps or jump to the PR on GitHub.

I'm finding this workflow particularly exciting for side projects because I can
kick off feature experiments from anywhere when the idea comes to me.
