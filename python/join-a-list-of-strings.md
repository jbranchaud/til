# Join A List Of Strings

Though joining a list of strings in Python is a basic task, I wanted to write
about it because it is backward from how it is done in Ruby (which trips me up
every single time).

So, in Ruby I would do the following:

```ruby
> character = ["Gimli", "Dwarf", "Fighter", "Lvl 23"]
=> ["Gimli", "Dwarf", "Fighter", "Lvl 23"]
> character.join(" ~ ")
=> "Gimli ~ Dwarf ~ Fighter ~ Lvl 23"
```

Notice that I call
[`join`](https://docs.ruby-lang.org/en/master/Array.html#method-i-join) on the
list of strings, passing it the specific separator that I want to use.

Python does it the other way around:

```python
>>> character = ["Gimli", "Dwarf", "Fighter", "Lvl 23"]
>>> " ~ ".join(character)
'Gimli ~ Dwarf ~ Fighter ~ Lvl 23'
```

The separator is the object that I call
[`join`](https://docs.python.org/3/library/stdtypes.html#str.join) on, passing
it the list of strings that I want to join.
