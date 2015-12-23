# Create hstore From Two Arrays

PostgreSQL allows the use of the `hstore` type by enabling the `hstore`
extension. One way to create an instance of `hstore` data is by passing two
arrays to the `hstore()` function. The first array is a set of keys and the
second array is the set of values.

```sql
> select hstore(array['one','two','three'], array['1','2','3']);
                hstore
--------------------------------------
 "one"=>"1", "two"=>"2", "three"=>"3"
```

The two arrays must be the same length or an error will occur.

```sql
> select hstore(array['one','two','three'], array['1','2']);
ERROR:  arrays must have same bounds
```
