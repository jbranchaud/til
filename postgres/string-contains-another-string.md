# String Contains Another String

You can check if a string *contains* another string using the `position`
function.

```sql
> select position('One' in 'One Two Three');
 position
----------
        1
```

It returns the 1-based index of the first character of the first match of
that substring.

```sql
> select position('Four' in 'One Two Three');
 position
----------
        0
```

If the substring doesn't appear within the string, then the result is 0.

Thus, you can determine if a string *contains* another string by checking if
the value resulting from `position` is greater than 0.
