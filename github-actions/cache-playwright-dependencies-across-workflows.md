# Cache Playwright Dependencies Across Workflows

With the help of `actions/cache@v3`, I can cache the dependency install and
setup involved with using Playwright in GitHub Actions. That setup, in my
experience, typically takes ~45s. When it is already cached, it is able to skip
that step entirely greatly reducing the overall run time of the script.

First, I need to define a cache (`playwright-cache`). Second, I need to only
install the Playwright dependencies when that cache isn't available (`cache-hit
!= 'true'`).

Here is a striped down workflow demonstrating that.

```yaml
name: Playwright Script
on:
  workflow_dispatch:
jobs:
  Cached-Playwright-Script:
    runs-on: ubuntu-latest
    steps:
      - name: Check out repository code
        uses: actions/checkout@v3
      - uses: actions/cache@v3
        id: playwright-cache
        with:
          path: |
            ~/.cache/ms-playwright
          key: ${{ runner.os }}-playwright-${{ hashFiles('**/package-lock.json') }}
      - name: Install dependencies
        run: npm ci
      - name: Install playwright deps
        run: npx playwright install --with-deps chromium
        if: steps.playwright-cache.outputs.cache-hit != 'true'
      - run: node playwright-script.js
```

If I add the caching step and the cache-conditional `playwright install` steps
to another workflow in this project, the cache will be available to both of
them. That means they both benefit from the savings of that work having already
been cached.

[source](https://justin.poehnelt.com/posts/caching-playwright-in-github-actions/)
