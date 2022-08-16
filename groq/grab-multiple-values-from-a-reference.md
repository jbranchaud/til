# Grab Multiple Values From A Reference

Let's say we have an `author` with some attributes including a reference to a
`person` which contains more data about the person. Here is one way to write a
query to access that data.

```groq
*[_type == 'author' && slug.current == 'donna-tartt']{
  website,
  'firstName': person->firstName,
  'lastName': person->lastName,
  'age': person->age
}
```

Here is another way to write this query that doesn't do three separate accesses
on the `person` reference.

```groq
*[_type == 'author' && slug.current == 'donna-tartt']{
  website,
  person-> {
    'firstName': firstName,
    'lastName': lastName,
    'age': age
  }
}
```

This isn't quite right though because it leaves the three reference values
nested under `person`. We can get back to the original shape of our query by
flattening the `person` object using familiar looking spread syntax (`...`).

```groq
*[_type == 'author' && slug.current == 'donna-tartt']{
  website,
  ...person-> {
    'firstName': firstName,
    'lastName': lastName,
    'age': age
  }
}
```
