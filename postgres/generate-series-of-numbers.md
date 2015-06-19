# Generate Series Of Numbers

Postgres has a `generate_series` function that can be used to, well,
generate a series of something. The simplest way to use it is by giving it
`start` and `stop` arguments

```sql
> select generate_series(1,5);
 generate_series 
-----------------
               1
               2
               3
               4
               5
```

The default step is 1, so if you want to count backwards, you need to
specify a negative step


```sql
> select generate_series(5,1,-1);
 generate_series 
-----------------
               5
               4
               3
               2
               1
```

You can use a larger step value to, for instance, get only multiples of 3

```sql
> select generate_series(3,17,3);
 generate_series 
-----------------
               3
               6
               9
              12
              15
```

Trying this out with timestamps is left as an exercise for the reader.
