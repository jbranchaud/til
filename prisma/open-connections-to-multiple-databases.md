# Open Connections To Multiple Databases

A standard database connection with Prisma is determined by a `DATABASE_URL`
env var set in the `.env` file of your project. Typically, the Prisma client
connecting to that URL will be configured in a separate file and imported
wherever it is used.

```javascript
import {prisma} from './utils/prisma'
```

What if you want to connect to a second, alternate database?

You can create a new Prisma client with the data source configured to be a
different connection URL.

```javascript
import {prisma as primaryPrismaClient} from '@skillrecordings/database'
import {PrismaClient} from '@prisma/client'

const secondaryDatabaseUrl = 'mysql://root@localhost:3399/my-database'

const secondaryPrismaClient = new PrismaClient({
  datasources: {
    db: {
      url: secondaryDatabaseUrl
    }
  },
})
```

And with that, you can execute queries against both databases.

```javascript
const primaryUserCount = await primaryPrismaClient.user.count()
const secondaryUserCount = await secondaryPrismaClient.user.count()
```

[source](https://www.prisma.io/docs/reference/api-reference/prisma-client-reference#programmatically-override-a-datasource-url)
