# Open An Unnamed Buffer

There are two ways (that I know of) to open an unnamed buffer.

The first is before vim has even been launched. You can simply execute `vim`
from the command-line without any arguments. Follow that by invoking `:ls`
to see that the current and only buffer has *no name*.

The second method is with a vim session that is already open. If you invoke
`:new`, a new buffer will be created that, like the first method, has *no
name*.
