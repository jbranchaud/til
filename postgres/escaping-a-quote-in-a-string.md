# Escaping A Quote In A String

In PostgreSQL, string (`varchar` and `text`) literals are declared with
single quotes (`'`). That means that any string containing a single quote
will need some escaping. The way to escape a single quote is with another
single quote.

```sql
> select 'what''s up!';
  ?column?
------------
 what's up!
```

[source](http://jonathansacramento.com/posts/20160122-improve-postgresql-workflow-vim-dbext.html)
