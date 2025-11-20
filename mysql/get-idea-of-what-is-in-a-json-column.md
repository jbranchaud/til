# Get Idea Of What Is In A JSON Column

While digging through some data trying to reacquaint myself with the overall
schema and data model, I ran into an issue selecting rows from this
`content_resource` table. There was so much text packed in to the `"body"`,
`"summary"`, and `"description"` key-value pairs of `fields` JSON column that a
simple `select * ... limit 3;` was overwhelming the screen with text and table
formatting characters (i.e. `+------+-------`).

I figured the `fields` JSON followed a reliable structure, at least for records
of the same `type`. So, let's start by only grabbing the
[`json_keys`](https://dev.mysql.com/doc/refman/8.4/en/json-search-functions.html#function_json-keys)
so that I can get a sense of the shape of the JSON.

```sql
select id, json_keys(fields)
from content_resource
where type = 'post'
limit 3;

+-----+-----------------------------------------------------------------------------------------------------------+
| id  | json_keys(`fields`)                                                                                       |
+-----+-----------------------------------------------------------------------------------------------------------+
|  1  | ["body", "slug", "state", "title", "summary", "postType", "visibility", "description", "originalLessonId"] |
|  2  | ["body", "slug", "state", "title", "summary", "postType", "visibility", "description", "originalLessonId"] |
|  3  | ["body", "slug", "state", "title", "summary", "postType", "visibility", "description", "originalLessonId"] |
+-----+-----------------------------------------------------------------------------------------------------------+
```

For the `post` type, I see the same keys for this sampling of rows. Now I have
an idea what keys are present and can start digging in further.

My next query might look something like this:

```sql
select id, fields->'$.slug', fields->'$.title', fields->'$.state'
from content_resource
where type = 'post'
limit 3;
```
