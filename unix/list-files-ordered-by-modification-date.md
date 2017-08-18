# List Files Ordered By Modification Date

The `ls` command lists the files in a directory. Tacking on the `-l` flag
will list it in long format. By default, everything is listed in
lexicographical order. This is what `ls -l` looks like for this repository.

```
-rw-r--r--    1 jbranchaud  staff    628 Feb 14  2016 CONTRIBUTING.md
-rw-r--r--    1 jbranchaud  staff   1058 Feb 19  2015 LICENSE
-rw-r--r--    1 jbranchaud  staff  40983 Aug 18 16:59 README.md
drwxr-xr-x    5 jbranchaud  staff    170 Apr  1 14:45 ack
drwxr-xr-x    5 jbranchaud  staff    170 Feb 24 16:31 chrome
...
```

Sometimes you want a sense of what has been modified and when.
Lexicographical order isn't going to help much here. By tacking on the `-t`
flag, the files will be listed in order of their modification dates. Here is
`ls -lt` for the same repository.

```
-rw-r--r--    1 jbranchaud  staff  40983 Aug 18 16:59 README.md
drwxr-xr-x  119 jbranchaud  staff   4046 Aug 17 11:38 vim
drwxr-xr-x    5 jbranchaud  staff    170 Aug 16 10:47 internet
drwxr-xr-x   23 jbranchaud  staff    782 Aug  1 10:17 javascript
drwxr-xr-x    7 jbranchaud  staff    238 Jul 22 14:04 webpack
...
```

See `man ls` for more details.
