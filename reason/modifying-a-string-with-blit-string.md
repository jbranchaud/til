# Modifying A String With blit_string

[ReasonML's `Bytes` module](https://reasonml.github.io/api/Bytes.html) has a
function called
[`blit_string`](https://reasonml.github.io/api/Bytes.html#VALblit_string).
This function allows you to copy portions of a string into a destination
byte sequence. It is a fairly low-level operation, so you have to provide a
source string and provide an offset of that source string to start copying
from. You then have to provide a properly sized byte sequence as well as the
destination's starting offset and length of bytes to be copied.

Here is an example of how we can use `blit_string` to create a copy of the
string with the first character removed.

```reason
let remove_first_char = (str: string): string => {
  let copy_len = String.length(str) - 1;
  let dst = Bytes.create(copy_len);
  Bytes.blit_string(str, 1, dst, 0, copy_len);
  Bytes.to_string(dst);
};
```

Notice that once the byte sequence has been copied over, we then need to
convert it back into a string.
