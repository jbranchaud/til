# Trigger A Workflow Via An API Call

We can set up a GitHub Actions workflow to run when triggered by an API call.
This is done with the [`workflow_dispatch`
event](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#workflow_dispatch).

First, we add `workflow_dispatch` to our workflow as a triggering event:

```yaml
on:
  workflow_dispatch:
```

Second, we create a fine-grained personal GitHub access token that has permissions
for dispatching to GitHub Actions. More details on that in the [GitHub
docs](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-fine-grained-personal-access-token).

Then, we can use `cURL` or some other tool for issuing an HTTP POST request to
[the workflow dispatch API
endpoint](https://docs.github.com/en/rest/actions/workflows?apiVersion=2022-11-28#create-a-workflow-dispatch-event). The `cURL` request will look something like this:

```bash
curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR-TOKEN>"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/OWNER/REPO/actions/workflows/WORKFLOW_ID/dispatches \
  -d '{"ref":"topic-branch","inputs":{"name":"Mona the Octocat","home":"San Francisco, CA"}}'
```

Note: we need to alter that URL with the `OWNER` and `REPO` that the workflow
lives in as well as the `WORKFLOW_ID` which can be the name of the workflow
file (e.g. `my-dispatchable-workflow.yml`).

This event also means that we can manually trigger the workflow from the
GitHub Actions UI for that workflow.
