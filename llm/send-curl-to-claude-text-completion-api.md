# Send cURL To Claude Text Completion API

Here is how we can make a `cURL` (`POST`) request to the Claude text completion
API. It requires already having a Claude API account with (paid) credits. At
this time, you can get $5 in free credits to try it out.

Assuming all that, we can grab an API key, store it somewhere safe and
accessible like 1Password, and then start formatting a request.

We need to specify a couple headers as well as `POST` body parameters.

```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -H "x-api-key: $(op item get "Anthropic Claude API Key" --field credential)" \
  -H "anthropic-version: 2023-06-01" \
  -d \
'{
  "model": "claude-2.1",
  "max_tokens_to_sample": 1024,
  "prompt": "Human: Show me an example of a simple Ruby program.\n\nAssistant:"
}' \
  https://api.anthropic.com/v1/complete
```

The required headers are:
- `"Content-Type: application/json"`
- `x-api-key` with our API key
- `"anthropic-version: 2023-06-01"` (the latest Anthropic API version)

Then, in the body, we specify:
- the `model` (e.g. `claude-2.1`)
- the max number of tokens you want the model to use
- a prompt that starts with `Human:` and then prompts the `Assistant:`

Note: this is a legacy API and the [Messages
API](https://docs.anthropic.com/claude/reference/messages_post) should be
preferred.

[source](https://docs.anthropic.com/claude/reference/complete_post)
