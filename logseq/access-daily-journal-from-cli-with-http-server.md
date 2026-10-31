# Access Daily Journal From CLI With HTTP Server

I use [logseq](https://logseq.com/) as the daily driver for my notes both inside
and outside of work. I like the organization provided by the outliner notetaking
style.

I now want to set up some automations that interact with my notes. I originally
figured this would involve reading directly from markdown files on disk.
However, they recently migrated to a SQLite storage format and I learned that
there is an HTTP server you can run for more reliable interactions.

The HTTP server needs to be enabled. To do this, I did the following (though I'm
not sure if _Developer Mode_ is required):

1. Find the `...` icon to access the app's main menu
2. Open _Settings_
3. Enable _Developer Mode_ under _Advanced_
4. Enable _HTTP API Server_ under _Features_
5. Restart the logseq app
6. Click the disabled _API_ icon that is in the upper-right next to the
   navigational arrows
7. Create a new _Authorization Token_ and copy the value
8. Click _Start Server_ and it will run at `http://127.0.0.1:12315`

With all that in place, the server is running and ready to accept my first
query. I want to get a look at my notes so far today, so I'll run a `curl`
request against the `/api` path with the auth token I copied.

```bash
❯ curl -s -X POST http://127.0.0.1:12315/api \
    -H "Authorization: Bearer $LOGSEQ_API_TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"method":"logseq.Editor.getPageBlocksTree","args":["Oct 31st, 2026"]}'
[{"updatedAt":1793456696397,"createdAt":1793456670024,"parent":{"id":5943},"children":[],"id":5947,"level":1,"uuid":"6ae5fa1e-afa2-46c9-abbc-abf58b434e3e","fullTitle":"Working on setting up the HTTP server for logseq to see if I can interact with it via the CLI.","content":"Working on setting up the HTTP server for logseq to see if I can interact with it via the CLI.","order":"a0","title":"Working on setting up the HTTP server for logseq to see if I can interact with it via the CLI.","page":{"id":5943}},{"updatedAt":1793456702190,"createdAt":1793456697156,"parent":{"id":5943},"children":[{"updatedAt":1793456702212,"createdAt":1793456702212,"parent":{"id":5948},"children":[],"id":5949,"level":2,"uuid":"6ae5fa3e-0865-4713-9690-c456fb1a37ad","fullTitle":"","content":"","order":"a0","title":"","page":{"id":5943}}],"id":5948,"level":1,"uuid":"6ae5fa39-96bc-4f26-9d5f-2b3b3a366070","fullTitle":"[[6aa01dba-1b28-4540-b205-5254ee37d825]]","content":"[[6aa01dba-1b28-4540-b205-5254ee37d825]]","order":"a1","title":"[[6aa01dba-1b28-4540-b205-5254ee37d825]]","page":{"id":5943},"refs":[{"id":642}]}]%
```

The data we pass as the request body includes the `method` we are running which
is "get all the blocks for the specified page"
([`getPageBlocksTree`](https://plugins-doc.logseq.com/logseq/Editor/getPageBlocksTree)).
The `args` then specify what page we are referring to. In this case, today's
daily journal -- `"Oct 31st, 2026"` (👻). The result is that pile of JSON.

Whenever I get a long line of JSON like that, I like to use `jq` at the very
least to pretty-print it or even to dig in a bit.

```bash
❯ curl -s -X POST http://127.0.0.1:12315/api \
    -H "Authorization: Bearer $LOGSEQ_API_TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"method":"logseq.Editor.getPageBlocksTree","args":["Oct 31st, 2026"]}' | jq
[
  {
    "updatedAt": 1793456696397,
    "createdAt": 1793456670024,
    "parent": {
      "id": 5943
    },
    "children": [],
    "id": 5947,
    "level": 1,
    "uuid": "6ae5fa1e-afa2-46c9-abbc-abf58b434e3e",
    "fullTitle": "Working on setting up the HTTP server for logseq to see if I can interact with it via the CLI.",
    "content": "Working on setting up the HTTP server for logseq to see if I can interact with it via the CLI.",
    "order": "a0",
    "title": "Working on setting up the HTTP server for logseq to see if I can interact with it via the CLI.",
    "page": {
      "id": 5943
    }
  },
  ...
]
```
