# Initialize A PyTorch Tensor

A _tensor_ is an n-dimensional array that takes on a specified shape and holds
scalars, typically floats, in each of its positions.
[PyTorch](https://pytorch.org/) has a comprehensive suite of tools for working
with tensors. To work with tenors, the first thing I need to do is initialize
one. Here are a handful of ways to create a 2-dimensional tensor (a matrix)
depending on various needs.

Here is a 3x4 matrix full of zeros:

```python
>>> torch.zeros(torch.Size((3, 4)))
tensor([[0., 0., 0., 0.],
        [0., 0., 0., 0.],
        [0., 0., 0., 0.]])
```

Here is a 3x4 matrix full of ones:

```python
>>> torch.ones(3,4)
tensor([[1., 1., 1., 1.],
        [1., 1., 1., 1.],
        [1., 1., 1., 1.]])
```

And here is a 3x4 matrix full of a specific other value:

```python
>>> torch.full((3,4), 13.0)
tensor([[13., 13., 13., 13.],
        [13., 13., 13., 13.],
        [13., 13., 13., 13.]])
```

PyTorch is very flexible. I can specify the shape of the `tensor` with
positional arguments or a tuple for the dimensions. I can even construct a
`torch.Size` object.

Here is an arguably more useful example where the matrix is seeded with random
values in the range `[0,1)` using
[`torch.rand`](https://docs.pytorch.org/docs/2.13/generated/torch.rand.html):

```python
>>> torch.rand(torch.Size((3,4)))
tensor([[0.4148, 0.8045, 0.3093, 0.3363],
        [0.0120, 0.7161, 0.1108, 0.5510],
        [0.4805, 0.9430, 0.2852, 0.0966]])
```

These could be used as starting weights in a training process that then get
tweaked over time.

There are other random tensor functions like
[`torch.randint`](https://docs.pytorch.org/docs/2.13/generated/torch.randint.html)
and
[`torch.randn`](https://docs.pytorch.org/docs/2.13/generated/torch.randn.html).

How about a [random permutation](https://docs.pytorch.org/docs/2.13/generated/torch.randperm.html)
of integers `[0,12)` reshaped into a 3x4 matrix:

```python
>>> torch.randperm(12).reshape(3,4)
tensor([[ 0,  3,  1, 11],
        [ 7,  8,  9,  4],
        [10,  5,  6,  2]])
```

And though there are many other ways to initialize a tensor, the last one I will
show is
[`torch.eye`](https://docs.pytorch.org/docs/2.13/generated/torch.eye.html) which
creates a matrix with ones down the diagonal.

```python
>>> torch.eye(4)
tensor([[1., 0., 0., 0.],
        [0., 1., 0., 0.],
        [0., 0., 1., 0.],
        [0., 0., 0., 1.]])
```
