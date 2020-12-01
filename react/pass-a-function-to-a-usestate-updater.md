# Pass A Function To A useState Updater

Let's say you have a component with a toggle state:

```javascript
const [toggle, setToggle] = useState(false);
```

You can change the state of the toggle by directly passing a value to
`setToggle`.

```javascript
setToggle(true);
console.log(toggle);
//=> true
```

Alternatively, you can pass a function to the updater. This is called a
[_functional
update_](https://reactjs.org/docs/hooks-reference.html#functional-updates). The
updater will call the function with the previous state value and update the
state to whatever the function returns.

```javascript
const handleToggle = (prevToggle) => {
  return !prevToggle;
}

console.log(toggle);
//=> true

setToggle(handleToggle);

console.log(toggle);
//=> false
```
