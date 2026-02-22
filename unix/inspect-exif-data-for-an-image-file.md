# Inspect EXIF Data For An Image File

The `exiftool` CLI (which can be downloaded via `brew`) is a useful tool for
inspecting all the EXIF data attached to a media file. A media file like an
image has a bunch of additional details embedded in it like timestamps, image
metadata, and sometimes location information.

Here is all the data attached to a screenshot I found on my desktop:

```bash
❯ exiftool ~/Desktop/CleanShot\ 2025-11-17\ at\ 11.22.18@2x.png
ExifTool Version Number         : 13.50
File Name                       : CleanShot 2025-11-17 at 11.22.18@2x.png
Directory                       : /Users/lastword/Desktop
File Size                       : 1194 kB
File Modification Date/Time     : 2025:11:17 11:22:21-06:00
File Access Date/Time           : 2025:12:15 10:43:55-06:00
File Inode Change Date/Time     : 2025:12:05 15:37:48-06:00
File Permissions                : -rw-r--r--
File Type                       : PNG
File Type Extension             : png
MIME Type                       : image/png
Image Width                     : 2502
Image Height                    : 1232
Bit Depth                       : 8
Color Type                      : RGB with Alpha
Compression                     : Deflate/Inflate
Filter                          : Adaptive
Interlace                       : Noninterlaced
XMP Toolkit                     : XMP Core 6.0.0
Y Resolution                    : 144
Resolution Unit                 : inches
X Resolution                    : 144
Exif Image Width                : 2502
Color Space                     : sRGB
User Comment                    : Screenshot
Exif Image Height               : 1232
SRGB Rendering                  : Perceptual
Image Size                      : 2502x1232
Megapixels                      : 3.1
```

This works with other kinds of media files. For instance, I ran this against an
MP4 screen recording file which contained even more metadata.

In addition to reading data, `exiftool` can also write it. See `man exiftool`
for more details on what else it can do.
