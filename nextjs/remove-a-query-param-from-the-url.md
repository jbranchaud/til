# Remove A Query Param From The URL

Let's say you have a Next.js app. Sometimes users visit the app with special
query params. You want to extract the value of those query params, do something
with them, and then remove them from the URL.

This can be done with
[`next/router`](https://nextjs.org/docs/api-reference/next/router).

Let's say this component loads while the app URL is `/home?code=123`.

```javascript
import React, { useEffect } from "react";
import {useRouter} from "next/router";

function SomeComponent() {
  const router = useRouter();

  useEffect(() => {
    // extract the value from the query params
    const { code, ...updatedQuery } = router.query;

    if (!!code) {
      // do something with the extract query param
      doSomethingWithCode(code);

      // create an updated router path object
      const newPathObject = {
        pathname: router.pathname,
        query: updatedQuery
      }

      // update the URL, without re-triggering data fetching
      router.push(newPathObject, undefined, { shallow: true });
    }
  }, [])

  return (
   ...
  );
}
```

After the mount, the URL will read `/home` and the code will have done
something with the code value.

This is accomplished by destructuring the target query param apart from the
rest, constructing a new router path object with the rest of the query params,
and then [pushing that route update
_shallowly_](https://nextjs.org/docs/routing/shallow-routing) so that data
doesn't get refetched.
