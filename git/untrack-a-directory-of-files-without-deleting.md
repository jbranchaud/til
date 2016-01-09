# Untrack A Directory Of Files Without Deleting

In [Untrack A File Without Deleting It](untrack-a-file-without-deleting-it.md),
I explained how a specific file can be removed from tracking without
actually deleting the file from the local file system. The same can be done
for a directory of files that you don't want tracked. Just use the `-r`
flag:

```bash
$ git rm --cached -r <directory>
```

[source](http://stackoverflow.com/questions/1143796/remove-a-file-from-a-git-repository-without-deleting-it-from-the-local-filesyste)
