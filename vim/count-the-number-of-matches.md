# Count the Number of Matches

You can use the substitution functionality in vim to count the number
of matches for a given search term like so:

```
:%s/transaction_id//n
```

You will see the result in the command tray like so:

```
8 matches on 8 lines
```

If you want to find matches globally (that is, counting multiples per line),
you can add the `g` flag:

```
:%s/transaction_id//gn
```

for a response like:

```
13 matches on 8 lines
```

The magic is in the `n` flag which tells vim to report a count of the
matches and not actually perform the substitution. See `:h :s_flags` for
more details. Also, check out `:h count-items`.
