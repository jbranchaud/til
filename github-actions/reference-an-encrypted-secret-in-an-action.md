# Reference An Encrypted Secret In An Action

CI environments like GitHub Actions want to help you keep your secrets secret.
They allow you to store an encrypted version of a secret that can be access in
an action.

First, you need to add an encrypted secret to your repository. Navigate to your
repository's _Settings_ page and then to the _Secrets_ tab. You can then add
the secret with the _New repository secret_ button.

Once the secret is added, you can reference it in your actions.

Let's say you added your repository secret with the name `MY_API_KEY`. And then
let's say that your project needs to be built with that API key available in
the environment as `SECRET_API_KEY`. You can reference it from `secrets` in the
`env` section.

```yaml
  - name: Build the JS bundle
    run: yarn build
    env:
      SECRET_API_KEY: ${{ secrets.MY_API_KEY }}
```

Though this API key is stored on GitHub's servers as an encrypted value, it
will be decrypted when this workflow step is run.

[source](https://docs.github.com/en/actions/reference/encrypted-secrets#using-encrypted-secrets-in-a-workflow)
