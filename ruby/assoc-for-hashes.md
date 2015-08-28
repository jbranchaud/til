# Assoc For Hashes

Ruby's Hash class comes with a method, `assoc`, which is good for grabbing
both the key and value from a hash. If the given key matches it returns a
two element array with the key and value.

```ruby
> stuff = {a: 1, b: 2, c: 3}
=> {a: 1, b: 2, c: 3}
> stuff.assoc(:c)
=> [:c, 3]
```

If a key is used that doesn't exist in the hash, then it simply returns nil.

```ruby
> {}.assoc(:c)
=> nil
```
