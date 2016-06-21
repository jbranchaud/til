# Open The Current Command In An Editor

If you are working with a complicated command in the terminal trying to get
the arguments just right. Such as this `curl`:

```bash
curl https://api.stripe.com/v1/customers \
   -u sk_test_BQokikJOvBiI2HlWgH4olfQ2: \
   -d description="Customer for test@example.com" \
   -d source=tok_189fCz2eZvKYlo2CsGERUNIW
```

It can be tedious to move to and modify various parts of the command.
However, by hitting `Ctrl-x Ctrl-e`, the contents of the command buffer
will be opened into your default editor (i.e. `$EDITOR`). This will make
editing the command a bit easier. Saving and quitting the editor will put
the updated command in the command buffer, ready to run.

Hit `Ctrl-x Ctrl-e` with an empty command buffer if you want to start
crafting a command from scratch or if you are pasting one in from somewhere.

h/t Josh Davey
