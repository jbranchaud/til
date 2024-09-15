# Convert SVG To Favicon

The imagemagick `convert` CLI tool can convert an SVG file into a transparent
favicon (ICO) file with the different standard sizes.

Assuming the background that we want to make transparent is white, then include
`-transparent white` and then to resize the icon include `-define
icon:auto-resize ...`. Point to the `image.svg` to be converted and specify the
name of the output file (`favicon.ico`).

```bash
$ convert image.svg -transparent white -define icon:auto-resize=16,32,48,64,128 favicon.ico
```

We can then use the `identify` CLI to inspect the `favicon.ico` file to see
that the above worked.

```bash
$ identify favicon.ico

favicon.ico[0] ICO 16x16 16x16+0+0 8-bit sRGB 0.000u 0:00.002
favicon.ico[1] ICO 32x32 32x32+0+0 8-bit sRGB 0.000u 0:00.004
favicon.ico[2] ICO 48x48 48x48+0+0 8-bit sRGB 0.000u 0:00.004
favicon.ico[3] ICO 64x64 64x64+0+0 8-bit sRGB 0.000u 0:00.004
favicon.ico[4] ICO 128x128 128x128+0+0 8-bit sRGB 99678B 0.000u 0:00.003
```

[source](https://www.joshmcarthur.com/2024/06/19/Auto-resizing-images-for-.ico-files.html)
