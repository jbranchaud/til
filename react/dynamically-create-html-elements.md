# Dynamically Create HTML Elements

An HTML element can be created with a string that matches a recognized
entity.

```javascript
const Paragraph = 'p';
return <Paragraph>Some paragraph content</Paragraph>
```

This means we can dynamically create HTML elements such as headers:

```javascript
const H = ({ level, ...props }) => {
  const Heading = `h${Math.min(level, 6)}`;
  return <Heading {...props} />;
};

return (
  <React.Fragment>
    <H level={1}>Header 1</H>
    <H level={2}>Header 2</H>
    <H level={5}>Header 5</H>
  </React.Fragment>
);
```

With some
[inspiration](https://medium.com/@Heydon/managing-heading-levels-in-design-systems-18be9a746fa3),
I've created a [live example here](https://codesandbox.io/s/3v202wmmy1).
