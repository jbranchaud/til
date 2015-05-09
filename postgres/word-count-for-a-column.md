# Word Count for a Column

Assuming I have a database with a posts table:

```sql
> select * from posts where id = 1;
 id |  title   |              content               
----+----------+------------------------------------
  1 | My Title | This is the content of my article. 
```

I can compute the word count of the content of a given post like so:

```sql
> select sum(array_length(regexp_split_to_array(content, '\s+'), 1)) from posts where id = 1;
 sum 
-----
   7 
```

[source](http://blog.lingohub.com/2013/07/sql-word-count-character-count-postgres/)
