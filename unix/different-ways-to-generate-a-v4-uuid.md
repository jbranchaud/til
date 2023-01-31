# Different Ways To Generate A v4 UUID

There have been times where I have needed a random UUID. Usually if I am
mocking some data or testing something out that needs a value in the shape of a
UUID. Here are a couple different ways to do this in the terminal, as
one-liners.

With `ruby` and the `SecureRandom` class:

```bash
$ ruby -e "require 'securerandom'; puts SecureRandom.uuid"
29e52b97-b43d-4025-a43d-70053b1d1a63
```

With `psql` and the `gen_random_uuid()` function:

```bash
$ psql -Xqtc 'select gen_random_uuid()' postgres | xargs
5a925ebd-c85f-4d94-a81e-e229c4cbe99f
```

With the `uuidgen` function that ships with Unix/Linux OSs:

```bash
$ uuidgen
B11555D8-A256-4EC8-A0B0-9259FF88C3FC
```
