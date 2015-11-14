# Unloading A Buffer

My preferred workflow with vim involves working across as many buffers as I
need in a single window. I open files in new buffers as needed and navigate
between existing ones with a number of built-in vim features and plugin
shortcuts. Eventually though, my list of buffers gets a bit crowded making
it difficult to move around and keep everything straight. One method for
dealing with this is occasionally unloading the buffers you no longer need.
This can be accomplished with `:bd`.

To unload the current buffer:

```
:bd
```

To unload some other buffer by buffer number, say buffer 10:

```
:10bd
```

Caveats: unloading a buffer marks it as *unlisted* in the buffer list,
meaning it won't appear in your normal view of the buffer list. It should
also be noted that it does not remove the buffer from the jump list or the
global mark list.

See `:h :bd` for more details.
