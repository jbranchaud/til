# Character Codes from Keyboard Listeners

If I create the following keyboard event listeners for `keydown`,
`keypress`, and `keyup`:

```javascript
window.addEventListener('keydown', function(e) { console.log("Keydown: " + e.charCode + ", " + e.keyCode); });
window.addEventListener('keypress', function(e) { console.log("Keypress: " + e.charCode + ", " + e.keyCode); });
window.addEventListener('keyup', function(e) { console.log("Keyup: " + e.charCode + ", " + e.keyCode); });
```

and then I press `A`, my browser console will read the following:

```
Keydown: 0, 65
Keypress: 65, 65
Keyup: 0, 65
```

and if I then press `a`, my browser console will read:

```
Keydown: 0, 65
Keypress: 97, 97
Keyup: 0, 65
```

The `keypress` event seems to be the way to go. Regardless, there seems to
be quite a bit of [incompatibility and lack of
support](https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent#Browser_compatibility)
across browsers for various aspects of the keyboard events.
