# Reveal Location Of File In Finder.app

In the terminal I have the path to an image file. I want to open Finder.app to
the location of that image file so that I can drag and drop it into a file
upload area in the browser.

Instead of opening a Finder.app window and navigating directory by directory to
the location, I can use the `open` command. Using `open` directly with the image
file will open the image in Preview.app. I want to reveal the directory that the
image file is in within Finder.app. _Reveal_ is the keyword and the `-R` flag
does just that.

Here is an example of this that I actually ran when uploading a screenshot that
went into [this blogmark post](https://still.visualmode.dev/blogmarks/255):

```bash
$ open -R /Users/lastword/images/tiobe-index-graph-march-2026.png
```

See `man open` for more details.
