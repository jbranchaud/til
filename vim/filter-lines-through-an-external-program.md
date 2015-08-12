# Filter Lines Through An External Program

Vim allows you to filter lines from your current buffer through an external
program. For instance, if you have some ugly looking json that you'd like to
format in a readable way, you might want to filter it through an external
json pretty printer program.

To filter the entire file through an external program, use

```
:%!! <external-program>
```

Or you can make a visual selection and just filter that

```
:'<,'>!! <external-program>
```

See `:h !!` for more details.
