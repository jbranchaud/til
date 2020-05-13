# Access Instance Variables

You can define instance variables when instantiating a class.

```python
class Person:
    def __init__(self, first_name, last_name):
        self.first_name = first_name
        self.last_name = last_name

    def full_name(self):
        return self.first_name + " " + self.last_name
```

Then those instance variables can be accessed as properties of that class
instances.

```python
me = Person("Josh", "Branchaud")

print(me.first_name) #=> "Josh"
print(me.full_name()) #=> "Josh Branchaud"
```
