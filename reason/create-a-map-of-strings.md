# Create A Map Of Strings

[ReasonML](https://reasonml.github.io/en) has the [`Map.Make`
functor](https://reasonml.github.io/api/Map.Make.html) in its standard
library which allows you to create a `Map` module with a specific key type.
Here is how we can make a map module with string keys.

```reason
module StringMap = Map.Make(String);
```

We can then use that module to to create an empty map followed by adding
key-value pairs to it.

```reason
StringMap.empty
|> StringMap.add("Morty", "Smith")
|> StringMap.add("Rick", "Sanchez")
|> StringMap.add("Scary", "Terry")
|> StringMap.iter((first, last) => {
  print_endline(Printf.sprintf("%s %s", first, last));
});
/*
Morty Smith
Rick Sanchez
Scary Terry
*/
```

See the [live
example](https://reasonml.github.io/en/try?rrjsx=true&reason=LYewJgrgNgpgBAZQC4CcCWA7A5gWQIYAOcAvHPgQHT4DWMAFMutgJQDcAUO45roRTMAJIAnuwA+APkSoe5CnjBg6AIhwgUI5QBo4yhMDRIAFsubip3bHIVLlAJTQBjatt0I8GR0ZgAvU+ekmXkobFQRHPBRhV2UAFRgUKP9JQNk+QwS6OgAzNBQAZyQdKDxC5hIpAG92ODgCJiQAfRgMMChMegAFBuyKfPrMJGyVAFJ8uDHXXIKiuBKytnYAXzYgA).
