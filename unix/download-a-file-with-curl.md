# Download A File With Curl

Though I typically think of cURL as a way of hitting an API endpoint to check
its headers or see what it returns, it can also be used as an alternative to
`wget` to download a file.

With the `-O` option (short for `--remote-name`) we instruct cURL to save the
contents of the remote file to a local file in the current directory _using the
same name as the remote_.

Here is an example:

```bash
$ curl -O https://www.apache.org/dist/db/derby/db-derby-10.17.1.0/db-derby-10.17.1.0-bin.zip.asc
```

This creates a file in my current directory called
`db-derby-10.17.1.0-bin.zip.asc`. Notice it only uses the last part of the path
for the file name.

See `man curl` for more details.

[source](https://stackoverflow.com/questions/4572153/os-x-equivalent-of-linuxs-wget#comment84857090_4572158)
