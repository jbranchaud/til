# Use The llm CLI With Claude Models

[Simon Willison's `llm`](https://llm.datasette.io/en/stable/index.html) can be
used with a bunch of different models (local and API). The whole thing is
plugin driven. To use a specific model, you'll need to install the plugin for
it. For instance, to use the [Claude 3 family of
models](https://www.anthropic.com/news/claude-3-family) you need to install
`llm-claude-3`.

```bash
$ llm install llm-claude-3
```

Then when prompting `llm`, specify which of the Claude models you want to use —
`claude-3-haiku`, `claude-3-sonnet`, or `claude-3-opus` — with the `-m` flag:

```bash
$ llm \
  -m claude-3-haiku \
   --key $CLAUDE_API_KEY \
  'Show me the SQL query to create a cocktails table.'
```

Note: instead of adding my Claude API key to the key store, I've opted to
include it with the `--key` flag via an environment variable that I've set
ahead of time.
