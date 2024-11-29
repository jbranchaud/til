# Organize Pages In Route Groups

With the Next.js App Router we can organize pages without affecting the URL
path structure by nesting those directories and pages within a _Route Group_. A
Route Group is directory where the name is surrounded by parentheses, e.g.
`/(symbols)`.

For instance, in my [Ruby Operator
Lookup](https://www.visualmode.dev/ruby-operators) project, I have the
following structure:

```bash
$ exa --true src/app/ruby-operators

src/app/ruby-operators
├── (symbols)
│  ├── ampersand
│  │  └── page.mdx
│  ├── arbitrary-keyword-arguments
│  │  └── page.mdx
│  ├── asterisk
│  │  └── page.mdx
│  ├── at-symbol
│  │  └── page.mdx
│  ├── backtick
│  │  └── page.mdx
│  ├── ...
│  └── underscore
│     └── page.mdx
├── client-layout.tsx
├── layout.tsx
├── page.tsx
└── wrapper.ts
```

I'm able to organize all the different symbols and operators under a separate
directory `/(symbol)/`. That makes development easier. However, the end result
routing still has each symbol located directly under `/ruby-operators/`, e.g.
`/ruby-operators/ampersand`.

[source](https://nextjs.org/docs/app/getting-started/project-structure#route-groups)
