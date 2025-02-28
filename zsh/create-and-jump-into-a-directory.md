# Create And Jump Into A Directory

[Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) defines a function `take` that
we can use to both create and `cd` into a directory. If the directory already
exists, it will simply `cd` into that directory.

```bash
~/code
❯ take take-demo

~/code/take-demo
❯ mkdir already-exists

~/code/take-demo
❯ take already-exists

~/code/take-demo/already-exists
❯ cd ..

~/code/take-demo
❯ take one/two/three

~/code/take-demo/one/two/three
❯
```

First `take` creates and `cd`s into `take-demo`. Then `take` only `cd`s into
`already-exists`. Then we see that `take` can create multiple levels of nested
directories.

With the help of `which` we can see how `take` is defined:

```bash
$ which take
take () {
        if [[ $1 =~ ^(https?|ftp).*\.tar\.(gz|bz2|xz)$ ]]
        then
                takeurl "$1"
        elif [[ $1 =~ ^([A-Za-z0-9]\+@|https?|git|ssh|ftps?|rsync).*\.git/?$ ]]
        then
                takegit "$1"
        else
                takedir "$@"
        fi
}
```

We're not dealing with compressed files or git URLs, so we fall through to the
`else` block with invokes `takedir`.

```bash
$ which takedir
takedir () {
        mkdir -p $@ && cd ${@:$#}
}
```

The `mkdir -p $@` is what allows it make new, nested directories and then we
`cd` to it. The `${@:$#}` is a way of [grabbing the last argument to the
function](https://stackoverflow.com/a/37601842/535590). This suggests that you
can pass multiple things to `take`, it will create all of them, and then `cd`
you into the last one.

[source](https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/functions.zsh#L75-L85)
