# Rotate An Image To Be Oriented Upright

Many programs that display JPEG images will read the EXIF data for
'Orientation' headers so that they can correctly display the image. Not all of
them though. For instance, when a browser renders an `<img>` tag for such a
JPEG image, it won't account for the 'Orientation' header and you might end up
with a sideways image.

You can normalize the orientation with the
[`jhead`](https://www.sentex.ca/~mwandel/jhead/usage.html) utility which uses
[`jpegtran`](https://linux.die.net/man/1/jpegtran) under the hood. This is done
with the `-autorot` flag.

```bash
$ jhead -autorot my_image.jpeg
```

> Using the 'Orientation' tag of the Exif header, rotate the image so that it
> is upright. The program 'jpegtran' is used to perform the rotation. After
> rotation, the orientation tag of the Exif header is set to '1' (normal
> orientation). The Exif thumbnail is also rotated.

> This feature is especially useful with newer digital cameras [and
> smartphones], which set the orientation field in the Exif header
> automatically using a built in orientation sensor in the camera.

The image will now be upright in all programs.
