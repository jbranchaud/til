# findBy\* Queries Have Async Built In

The `getBy*` queries provided by [DOM Testing
Library](https://testing-library.com/docs/dom-testing-library/api-queries)
allow you to find an element by various criteria in the rendered component.
These queries are synchronous. If you need to find an element in response to an
async event, you'll have to wrap it in a `waitFor` call.

DOM Testing Library also provides a set of `findBy*` queries as a convenience
which have essentially wrapped the corresponding `getBy*` calls in `waitFor`
calls  under the hood.

You can use these with async/await:

```javascript
test("displays validation warnings for required fields", async () => {
  render(<MyFormComponent />);

  fireEvent.click(screen.getByText("Submit"));

  // validation on Name field
  const nameValidation = await screen.findByTestId("error-name");
  expect(nameValidation.innerHTML).toBe("Required");
});
```

[source](https://twitter.com/davidcrespo/status/1296639929376792577?s=20)
