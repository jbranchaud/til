# Hide Overflowing Text For Google Sheets Column

I imported a big CSV into a new Google Sheets document. This included a
"Description" column with many of the descriptions varying between 50 and 80
characters. The bottom line is that the description column was flowing over the
top of the columns next to it. Instead of expanding the width of that column as
far as the largest description, I wanted to hide the _overflow_.

The way to do this in Google Sheets is to highlight the entire column by
clicking on the column grouping. Then under the _Format_ menu item is a
_Wrapping_ submenu. The _Clip_ option is what I was looking for because it clips
the text that gets shown at the edge of the column.
