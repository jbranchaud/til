# Pattern Matching

My first stuff learn in Elixir. Pattern Matching !

```shell
iex(7)> list = [1,2,3]
[1, 2, 3]
iex(8)> [a, b, c] = list
[1, 2, 3]
iex(9)> a
1
iex(10)> b
2
iex(11)> list = [2,3,4]
[2, 3, 4]
iex(12)> [a,3,b] = list
[2, 3, 4]
iex(13)> a
2
iex(14)> b
4
iex(15)> 3
3
iex(16)> [a,2,b] = list
** (MatchError) no match of right hand side value: [2, 3, 4]
```

That's really cool!
