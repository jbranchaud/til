# Sort In Numerical Order

By default, the `sort` command will sort things alphabetically. If you have
numerical input though, you may want a numerical sort. This is what the `-n`
flag is for.

If I have a directory of files with numbered names, sort doesn't quite do
the job by itself.

```bash
$ ls | sort
1.txt
10.txt
11.txt
12.txt
2.txt
3.txt
4.txt
5.txt
```

with the `-n` flag, I get the sort order I am looking for.

```bash
$ ls | sort -n
1.txt
2.txt
3.txt
4.txt
5.txt
10.txt
11.txt
12.txt
```
