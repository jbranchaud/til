# Deleting Buffers In BufExplorer

The [BufExplorer](https://github.com/jlanzarotta/bufexplorer) plugin makes
it easy to browse and navigate to the various buffers open in a Vim session.
It is based on your buffer list. After a bit of coding, your buffer list can
start to get a bit out of control. There are surely going to be buffers that
you want to close out, *delete* if you will.

Within the BufExplorer browser you can move your cursor onto a buffer and
delete it.

To delete it by *unloading* the buffer (see `:h bd`), you can hit `d`.

To delete it by *wiping out* the buffer (see `:h bw`), you can hit `D`.

If you already have the plugin installed, see `:h bufexplorer` for more
details.
