# Check Properties Of An Image With `sips`

I [used Figma to create a basic design for a t-shirt
screenprinting](https://bsky.app/profile/jbranchaud.bsky.social/post/3mz43v6asns2f).
Before I sent the image asset off to the printer, I needed to verify a couple
properties of the image where right.

My first thought was that there is probably a way to do this with `ffmpeg`, but
I intentionally asked Claude in a non-leading way how to do this. It surfaced a
Mac-specific utility I'd never heard of -- `sips` (_Scriptable Image Processing
System_).

Sometimes it is hard to tell if an image exported correctly with transparent
background (alpha channel). Part of how I was able to verify that was to point
`sips` at the PNG file and ask if it has an alpha channel. The `-g` flag (short
for _get property_) is the way to output a property like this.

```bash
❯ sips -g hasAlpha ~/Downloads/Untitled/orange-shirt-print-front.png
/Users/lastword/Downloads/Untitled/orange-shirt-print-front.png
  hasAlpha: yes
```

I then wanted to check that the dimensions of the image were right. I had
carefully sized the canvas in Figma to correspond to specs required by the
printer. Similar to above, I can use `-g` to grab the `pixelWidth` and
`pixelHeight` properties of the image.

Unfortunately the pixel dimensions of the exported PNG were not what I was
expecting.

```bash
❯ sips -g pixelWidth -g pixelHeight ~/Downloads/Untitled/orange-shirt-print-front.png
/Users/lastword/Downloads/Untitled/orange-shirt-print-front.png
  pixelWidth: 1152
  pixelHeight: 1536
```

I then found some additional export settings in Figma and tried again. Nailed
it.

```bash
❯ sips -g pixelWidth -g pixelHeight ~/Downloads/Marty\ Supreme\ —\ 12\ ×\ 16\ in\ print.png
/Users/lastword/Downloads/Marty Supreme — 12 × 16 in print.png
  pixelWidth: 3600
  pixelHeight: 4800
```

See `man sips` for more details.
