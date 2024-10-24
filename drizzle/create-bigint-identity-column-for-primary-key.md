# Create bigint Identity Column For Primary Key

Using the Drizzle ORM with Postgres, here is how we can create a table that
uses a [`bigint` data
type](https://orm.drizzle.team/docs/column-types/pg#bigint) as a primary key
[identity
column](https://www.postgresql.org/docs/current/ddl-identity-columns.html).

```typescript
import {
  pgTable,
  bigint,
  text,
  timestamp,
} from "drizzle-orm/pg-core";

// Users table
export const users = pgTable("users", {
  id: bigint({ mode: 'bigint' }).primaryKey().generatedAlwaysAsIdentity(),
  email: text("email").unique().notNull(),
  name: text("name").notNull(),
  createdAt: timestamp("created_at").defaultNow().notNull(),
});
```

There are a couple key pieces here:

1. We import `bigint` so that we can declare a column of that type.
2. We specify that it is a primary key with `.primaryKey()`.
3. We declare its default value as `generated always as identity` via
   `.generatedAlwaysAsIdentity()`.

Note: you need to specify the `mode` for `bigint` or else you will see a
`TypeError: Cannot read properties of undefined (reading 'mode')` error.

If we run `npx drizzle-kit generate` the SQL migration file that gets
generated will contain something like this:

```sql
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "users" (
  "id" bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "users_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START WITH 1 CACHE 1),
  "email" text NOT NULL,
  "name" text NOT NULL,
  "created_at" timestamp DEFAULT now() NOT NULL,
  CONSTRAINT "users_email_unique" UNIQUE("email")
);
```
