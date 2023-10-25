# Create A Local Sanity Dataset Backup

Let's say you've put together a script that is going to mutate some data in
your production dataset on Sanity. Before you run that script, it would be
prudent to capture a backup in case something goes wrong. That way you can
always restore to how the data was in the event that you need to.

You can do this from the command line with the `sanity` CLI.

First, ensure you are signed in via the CLI.

```bash
$ sanity login
```

Then, you can issue the `dataset export` command, naming the dataset (in this
case, `production`) to target and the name of the backup file to be created
locally.

```bash
$ sanity dataset export production my-project-backup.tar.gz
```

I believe the Sanity CLI goes off the `sanity.cli.{ts,js}` file in your local
project directory to determine what Sanity project it should be working with.

See the [`export dataset`](https://www.sanity.io/docs/dataset#fd38ca03b011)
docs for more details.
