# Show File Diffs When Viewing Git Log

Include the `-p` flag with the `git log` command to include the diffs along
with the rest of the information for each commit. Here is an example of
running this against this repository.

```bash
$ git log -p
commit b9809a329acd8150b2474168f8faaf008f376e35
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Wed Oct 11 07:27:53 2017 -0500

    Add Inline Style Attributes Should Be Camel Cased as a react til

diff --git a/README.md b/README.md
index c982f8e..6ee7d32 100644
--- a/README.md
+++ b/README.md
@@ -10,7 +10,7 @@ smart people at [Hashrocket](http://hashrocket.com/).
 For a steady stream of TILs from a variety of rocketeers, checkout
 [til.hashrocket.com](https://til.hashrocket.com/).

-_574 TILs and counting..._
+_575 TILs and counting..._

 ---
```

See `man git-log` for more details.
