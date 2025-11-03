# Open File On Remote Like GitHub

One of my favorite `vim-fugitive` features is being able to run the `:GBrowse`
command to open the current file or current selection of lines to GitHub in the
browser. This is useful for getting a shareable URL or even just being a
starting point for browsing the codebase from GitHub.

VSCode (as well as Cursor) supports this functionality as well. There are a
couple ways to do it.

First, from the File Browser sidebar you can right click on a particular file or
directory. Find the _Open on Remote (Web)_ submenu. From there select _Open File
on Remote_. That will open the file in GitHub with the focused line highlighted
(or will open to that directory, as the case may be).

Alternatively, you can right click in the file editor and follow the exact same
steps as described above.

If you're wanting a permalink to the remote that highlights a selection of
lines, you can highlight that section of lines and right-click the selected
lines and again follow the steps above.

If your remote is some other host like BitBucket, it will recognize that from
your project's gitconfig and open to that instead of GitHub.
