# Exit Function Early Without Retries

When an Inngest function fails due to an error, it will be retried up to 3
times with a scheduled back-off. That functionality is built-in. In some cases,
there is no sense retrying because the failure case isn't going to change. No
sense in wasting resources on retries that are going to yield the same result.

In this case, we can have our code raise a `NonRetriableError`.

```javascript
import { NonRetriableError } from "inngest"
import {inngest} from '@/inngest/inngest.server'
import {database} from '@/server/database'

export default inngest.createFunction(
  { id: "reindex-post-for-search" },
  { event: "post.updated" },
  async ({ event }) => {
    const post = await database.findPost({ id: event.data.postId })

    if(!post) {
      throw new NonRetriableError(`Post not found for id (${event.data.postId})`)
    }

    // handle reindexing of the post
  }
)
```

When inngest catches a `NonRetriableError` it knows to not schedule retries.

In the context of a try/catch block where some other error has been raised, we
can pass that error as a second argument to the `NonRetriableError` for
additional info:

```javascript
catch(err) {
  const message = `Post not found for id (${event.data.postId})`

  throw new NonRetriableError(message, { cause: err })
}
```

[source](https://www.inngest.com/docs/functions/retries)
