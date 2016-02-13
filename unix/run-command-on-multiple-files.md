# Run a command on multiple files

Sometimes you would like to run a command on multiple filenames generated
by the output of another command.  With `find` this is easy because it
inclues a builtin `exec` argument:

For example, to do a recursive search of the current directory and copy
the contents of all files ending in .txt to a single file, you could do
the following with the `find` command:

```
find . -name *.txt -exec cat {} >> all_text.txt \;
```

Sometimes, however, you are generating a list of files using some other
means, and would like to do the same thing.  If you have a file which
contains a list of filenames to remove, you could accomplish this
with:

```
cat files_to_remove.txt | xargs rm -f
```

This will, for each line in `files_to_remove.txt`, execute `rm -f <file>`.

This is fine for simple filenames, but xargs doesn't know that it is
processing text files, so all that it does is a string replacement.  
Hence, if your file names have spaces in them, `rm` will be confused.
To get around this, we can tell xargs to use a tag replacement when passing
input to its command:

```
cat files_with_spaces.txt | xargs rm -f "{}"
```

This will enclose each file in quotes, which will allow rm to process
it correctly.

xargs has many more convenient features for constructing commandlines, so
be sure to read the man page

```
man xargs
```
