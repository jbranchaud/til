# Run Dev Processes With Overmind Instead Of Foreman

Most Rails projects that I have worked on have used
[`foreman`](https://github.com/ddollar/foreman) as a development dependency for
running all the processes declared in your Procfile (`Procfile.dev`). As far as
having a single command to run everything (Rails server, asset building,
worker(s), etc.), it does the job.

`foreman` has some serious points of friction though. The one that really stands
out to me is that when I try to debug the development Rails server with
`binding.irb` or `binding.pry`, the other processes tend to interfere.

The alternative to `foreman` that I've been trying out recently is
[`overmind`](https://github.com/DarthSim/overmind). A specific selling point of
`overmind` is that it runs all the development processes in a `tmux` session.
That means you can individually connect to, inspect, and restart each process.

Once you've installed `overmind` (`brew install overmind`), then you can easily
swap it in for `foreman` like so:

```bash
$ overmind start -f Procfile.dev
```

You can connect to any of those processes directly:

```bash
$ overmind connect sidekiq
```

When you want to `binding.irb` the Rails server, you can specifically connect to
the `web` process to do that.

```bash
$ overmind connect web
```

If you need to stop all the process, you can run the `kill` subcommand.

```bash
$ overmind kill
```

Lastly, if you have a `bin/dev` script in your project, it is probably using
`foreman`. If you and your team prefer `overmind`, then update that script
accordingly and you can simply run `bin/dev` going forward.
