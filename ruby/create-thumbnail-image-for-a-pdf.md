# Create Thumbnail Image For A PDF

The [`rmagick`](https://rmagick.github.io/) gem is a wrapper around the
[ImageMagick](http://www.imagemagick.org/script/index.php) software suite.
This gem can be used to create a thumbnail image of a PDF using the
following snippet of code.

```ruby
require 'rmagick'
pdf = Magick::ImageList.new('document.pdf')
first_page = pdf.first
scaled_page = first_page.scale(300, 450)
scaled_page.write('document-thumbnail.jpg')
```

The scale can be adjust as necessary to the use case.

[source](http://stackoverflow.com/questions/65250/convert-a-doc-or-pdf-to-an-image-and-display-a-thumbnail-in-ruby)
