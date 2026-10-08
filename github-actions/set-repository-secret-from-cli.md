# Set Repository Secret From CLI

I set up a GitHub Action that will run daily and potentially push data up to a
3rd-party API. To be able to post to that API, the action must include a secret
as the bearer token in the requests. I need to securely include that secret in
the GitHub Actions environment for this repo.

I can do that from the CLI with `gh` like so:

```bash
❯ gh secret set TIL_SYNC_TOKEN
? Paste your secret: ****************************************************************
```

Notice that it prompts me for the secret and stars out what I paste in. That way
the secret doesn't end up in my bash history and isn't visible on my screen.

After I've run this, I can see that the secret is set by opening up the repo in
the GitHub web UI, clicking on _Settings_ > _Secrets and Variables_ > _Actions_.
I should see `TIL_SYNC_TOKEN` listed under the _Repository Secrets_ section.

Here is an excerpt from my workflow action sync script where that secret is
referenced -- notice the `${{ secrets.TIL_SYNC_TOKEN }}`.

```yaml
      - name: Sync posts
        env:
          TIL_SYNC_URL: ${{ vars.TIL_SYNC_URL }}
          TIL_SYNC_TOKEN: ${{ secrets.TIL_SYNC_TOKEN }}
        run: ruby script/til_sync/til_sync.rb --repo til ${{ inputs.all && '--all' || '--days 3' }}
```
