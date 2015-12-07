# Coercing Casing With vim-abolish

The [`vim-abolish`](https://github.com/tpope/vim-abolish) plugin provides a
couple handy shortcuts for quickly coercing the casing of a variable.

For instance, if you have a variable in camel case and you want to change it
snake case, you can navigate over the variable and hit `crs` (e.g.
`myFavoriteVariable` -> `my_favorite_variable`).

Similarly, you can hit `crc` to change a variable to camel case.

It even has support for mixed case (`crm`) and uppercase (`cru`).

h/t Jake Worth
