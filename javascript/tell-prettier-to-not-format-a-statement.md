# Tell Prettier To Not Format A Statement

[Prettier](https://prettier.io/) is a boon to productivity because individuals
and teams don't have to make any decisions about the fine details of how their
code is formatted. Generally, let `prettier` do its thing.

There are some situations where you want to preserve your own formatting,
especially if it improves readability.

Here is some `prettier` formatted code:

```javascript
const relativeCoords = {
  A: [xPos - 1, yPos - 1],
  B: [xPos, yPos - 1],
  C: [xPos + 1, yPos - 1],
  D: [xPos - 1, yPos],
  E: [xPos + 1, yPos],
  F: [xPos - 1, yPos + 1],
  G: [xPos, yPos + 1],
  H: [xPos + 1, yPos + 1],
};
```

Originally, I included some whitespace to keep things visually aligned. If I
include a `prettier-ignore` comment, the statement immediately following it
will not be touched by prettier.

```javascript
// prettier-ignore
const relativeCoords = {
  A: [xPos - 1, yPos - 1],
  B: [xPos    , yPos - 1],
  C: [xPos + 1, yPos - 1],
  D: [xPos - 1, yPos    ],
  E: [xPos + 1, yPos    ],
  F: [xPos - 1, yPos + 1],
  G: [xPos    , yPos + 1],
  H: [xPos + 1, yPos + 1],
};
```

[source](https://prettier.io/docs/en/ignore.html#javascript)
