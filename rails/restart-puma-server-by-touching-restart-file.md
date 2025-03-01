# Restart Puma Server By Touching Restart File

Puma includes a plugin that allows us to restart the web server by touching the
`tmp/restart.txt` file.

In one terminal pane I have my Rails server running. In another terminal pane
from the Rails directory, where there exists a `tmp` folder, I run the
following command.

```bash
$ touch tmp/restart.txt
```

Then in the pane running the Rails server, I see the following after a second:

```
* Restarting...
=> Booting Puma
=> Rails 8.0.1 application starting in development
...
```

What is happening is that `touch` updates the modified time of that file, which
already exists in the `temp` directory. When the plugin notices (it checks
every 2 seconds) that the modified time is now fresher than the original
modified time when the plugin started, then it calls `launcher.restart`.

[source](https://github.com/puma/puma/blob/ca201ef69757f8830b636251b0af7a51270eb68a/lib/puma/plugin/tmp_restart.rb)
