# Finding The Source of Ruby Methods

Ruby's [`Method`](http://ruby-doc.org/core-1.9.3/Method.html) class
includes a feature that can help you quickly find the location of
source code files where a particular method is defined. The method is aptly
named [`source_location`](http://ruby-doc.org/core-1.9.3/Method.html#method-i-source_location).

When debugging a project that is using the
[Treat](https://github.com/louismullie/treat) gem, you can take a source dive
by first finding the relevant source files. For instance, if you want to look
into the word creation functionality, you might go through an exploratory
process like the following:

```ruby
> require 'Treat'
=> true
> Treat::Entities::Word.build('stuff')
=> Word (70331843958460)  --- "stuff"  ---  {}   --- []
> Treat::Entities::Word.method(:build)
=> #<Method: Class(Treat::Entities::Entity::Buildable)#build>
> Treat::Entities::Word.method(:build).source_location
=> ["/Users/jbranchaud/.gem/ruby/2.1.4/gems/treat-2.1.0/lib/treat/entities/entity/buildable.rb", 29]
```

You can now take a closer look at the implementation of the `build` method.

The main caveat to this process is that it can only find source locations
for methods defined in ruby land. Calling `source_location` on any method
defined in C code will result in `nil`.
