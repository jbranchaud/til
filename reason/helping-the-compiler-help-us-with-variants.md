# Helping The Compiler Help Us With Variants

[ReasonML](https://reasonml.github.io/) gives us something called a variant
which is similar to what other language call enums and union types. By
defining a variant, we give the compiler some information about exactly what
values a variable can take on -- its allowed variants.

Here we define the kinds of roles that users in our system can have as well
as a `user` type for representing individual users:

```reason
type userType =
  | Student
  | Teacher
  | Admin;

type user = { role: userType, id: int };
```

And here is how we might use it in some authorization code:

```reason
let canCreateClasses(u: user) {
  switch(u.role) {
  | Student => false
  | Teacher => true
  };
};
```

We've neglected to include `Admin` in our switch statement. The compiler
will inform us of this with a warning.

> this pattern-matching is not exhaustive. Here is an example of a value
> that is not matched: Admin

[source
code](https://reasonml.github.io/en/try.html?reason=C4TwDgpgBArgzhATgFXNAvAKClAPlAZWBgBMIA7YbPKZCAQwGMALJa-AQRIFsBLcgNyZQkWAkRR0UAN5REAewA2EAFxikqSABoovEmv7AoAXyGZlRxvXIBhRA2AQbi+nARwAFDDXwkAShlqOAB3XmAWLwA6BWUA6XZCYjJKSQA+KAAzekUEBLomVgl0dOBEGAhqU0wqgCk4SMV5AHMPK1t7ekdnV3cPWRjVRNIKYB09NQBGACYAZhM-PwEgA)
