# Rename A File Through netrw

You can browse files in a directory through Vim using netrw. This can be done
by _editing_ a directory with Vim:

```bash
$ vim src/
```

You'll see a listing of the files and directories in `src`:

```
app/
index.js
README.md
utils/
```

You can move your cursor over one of those files and hit `R` to rename it. A
prompt will appear at the bottom of your Vim session with the file's current
name spelled out. You can edit inline and then hit enter to apply the renaming.

[source](https://superuser.com/questions/767026/can-i-rename-files-in-a-directory-with-vim#)
