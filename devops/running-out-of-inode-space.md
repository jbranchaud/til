# Running Out Of inode Space

Unix systems have two types of storage limitations. The first, and more
common, is a limitation on physical storage used for storing the contents of
files. The second is a limitation on `inode` space which represents file
location and other data.

Though it is uncommon, it is possible to run out of `inode` space before
running out of disk space (run `df` and `df -i` to see the levels of each).
When this happens, the system will complain that there is `No space left on
device`. Both `inode` space and disk space are needed to create a new file.

How can this happen? If lots of directories with lots of empty, small, or
duplicate files are being created, then the `inode` space can be used up
disproportionately to the amount of respective disk space. You'll need to
clean up some of those files before you can continue.

Sources: [this](http://blog.scoutapp.com/articles/2014/10/08/understanding-disk-inodes) and [this](http://www.linux.org/threads/intro-to-inodes.4130/)
