# Attribute Was

When modifying the attributes of an `ActiveRecord` object, you may want to
know what values the modified attributes used to have. `ActiveRecord` gets
some handy methods from the
[`ActiveModel::Dirty`](http://api.rubyonrails.org/classes/ActiveModel/Dirty.html)
module that allow you to check these values out even if the object's
attributes were changed before you received it (though you are out of luck
once it has been saved). Just add `_was` onto the end of the attribute in
question.

```ruby
>> pokemon.name
=> "Charizard"
>> pokemon.name = "Squirtle"
=> "Squirtle"
>> pokemon.name
=> "Squirtle"
>> pokemon.name_was
=> "Charizard"
>> pokemon.save
   ...
=> true
>> pokemon.name_was == pokemon.name
=> true
```

[source](http://api.rubyonrails.org/classes/ActiveModel/Dirty.html)
