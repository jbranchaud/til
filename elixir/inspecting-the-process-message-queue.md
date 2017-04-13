# Inspecting The Process Message Queue

A core tenant of Elixir is message passing between processes. So, if a
process is sent a message, where does that message go? What happens if it
gets sent many messages? The `Process.info/2` function allows us to inspect
the message queue.

First, let's send some messages (to ourself) and then keep an eye on the
length of the message queue as we go.

```elixir
> send self(), {:error, "this is bad"}
{:error, "this is bad"}
> Process.info(self(), :message_queue_len)
{:message_queue_len, 1}
> send self(), {:hello, "world"}
{:hello, "world"}
> Process.info(self(), :message_queue_len)
{:message_queue_len, 2}
```

Now, I am curious what those specific messages are. Let's ask
`Process.info/2` for the messages that are in the message queue.

```elixir
> Process.info(self(), :messages)
{:messages, [error: "this is bad", hello: "world"]}
```

There are a lot of other things that `Process.info/2` can tell us about a
process. See [the Erlang docs for
`process_info`](http://erlang.org/doc/man/erlang.html#process_info-2) for
more details.
