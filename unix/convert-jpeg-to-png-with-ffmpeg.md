# Convert JPEG To PNG With ffmpeg

The `ffmpeg` utility "is a universal media converter." That means we can use it
to convert, for instance, a JPEG file to a PNG file.

There is not a lot to a conversion like this. We use `-i` to specify the
existing input file (a JPEG) and then the other argument is the name and
extension of the output file.

```bash
$ ls
profile.jpg

$ ffmpeg -i profile.jpg profile.png

$ ls
profile.jpg  profile.png
```

See `man ffmpeg` for more details.
