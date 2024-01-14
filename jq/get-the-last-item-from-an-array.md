# Get The Last Item From An Array

There are two ways to get the last item from an array using
[`jq`](https://jqlang.github.io/jq/).

The one that is perhaps a bit more intuitive is to pipe the array to the
[`last`](https://jqlang.github.io/jq/manual/#first-last-nth-2) function.

```bash
$ echo '[1,2,3]' | jq '. | last'
3
```

Another approach is to use an [array index
expression](https://jqlang.github.io/jq/manual/#array-index) to positionally
grab the last element of the array. As is the case with some languages and
libraries, `-1` positionally refers to the last item in the array.

```bash
$ echo '[1,2,3]' | jq '.[-1]'
3
```
