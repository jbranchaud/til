# Get Query Params From The Request URL

You can enable a Remix route to respond to query params in the URL in a
`loader` function. To do this, you first need to parse them out of the request
URL.

The arguments to the `loader` function will include the `request` object which
itself includes the `url`. From there, you can use the browser's [`URL`
constructor](https://developer.mozilla.org/en-US/docs/Web/API/URL/URL) to parse
and extract query params (i.e. search params).

```typescript
import type { LoaderFunction } from "@remix-run/node";

export async function loader({ request }): LoaderFunction {
  const url = new URL(request.url);
  const query = url.searchParams.get("q");

  results = await getResultsForQuery({ query });

  return { result };
}
```

The constructed `URL` object responds to
[`searchParams`](https://developer.mozilla.org/en-US/docs/Web/API/URL/searchParams)
which you can call `get()` on to get a specific query param value. This uses
the [`URLSearchParams`
API](https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams).

In the above case, we are able to grab the value of the `q` query param.

[source](https://remix.run/docs/en/v1/guides/data-loading#url-search-params)
