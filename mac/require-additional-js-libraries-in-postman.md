# Require Additional JS Libraries In Postman

When writing pre-request scripts and test scripts as part of a
[Postman](https://www.getpostman.com/) request, you aren't limited to
vanilla JavaScript. There are a handful of libraries that can be required
where needed.

This short list of available libraries includes `cherrio`, `lodash`, and
`moment`.

To pull one of these into a particular script, use the standard `require`
feature:

```javascript
var moment = require('moment');

var now = moment();
```

For a full list of what is available, check out [Postman's Sandbox API
Reference](https://www.getpostman.com/docs/postman/scripts/postman_sandbox_api_reference).
