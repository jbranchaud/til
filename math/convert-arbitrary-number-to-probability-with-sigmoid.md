# Convert Arbitrary Number To Probability With Sigmoid

A sigmoid function is a useful function in statistics and machine learning for
converting a number in the range of positive and negative real numbers into a
value between 0 and 1. Sigmoid functions can be a bit more diverse than this,
but this is a good basic definition.

Wikipedia defines another characteristic of sigmoid functions:

> A sigmoid function is any mathematical function whose graph has a
> characteristic S-shaped or sigmoid curve.

This S-shape is because it is asymptotic at the ends allowing it to cover all
real numbers in either direction.

A common sigmoid function and the one used by [PyTorch's `Sigmoid`](https://docs.pytorch.org/docs/2.13/generated/torch.nn.Sigmoid.html)
is this exponential form -- `σ(x) = 1 / (1 + exp(-x))`.

Here is what this looks like plotted on a graph:

![sigmoid function plotted on a graph](https://cdn.visualmode.dev/images/3cadb482-matplot-sigmoid-function-graph.png)

This function can be used any time we want to convert an arbitrary number into a
probability. Large negative numbers will approach 0. Large positive numbers will
approach 1. Numbers near 0 will settle somewhere in the middle.

Here are a few examples run through PyTorch's `sigmoid` function:

```python
print("σ(-99) => ", torch.sigmoid(torch.tensor(-99.0)))
print("σ(99) => ", torch.sigmoid(torch.tensor(99.0)))
print("σ(0.123) => ", torch.sigmoid(torch.tensor(0.123)))
print("σ(-2) => ", torch.sigmoid(torch.tensor(-2.0)))
print("σ(1) => ", torch.sigmoid(torch.tensor(1.0)))
```

which prints out:

```
σ(-99) =>  tensor(0.)
σ(99) =>  tensor(1.)
σ(0.123) =>  tensor(0.5307)
σ(-2) =>  tensor(0.1192)
σ(1) =>  tensor(0.7311)
```
