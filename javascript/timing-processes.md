# Timing Processes

If you want to time a process, you can use the `console.time()` and
`console.timeEnd()` utilities specified by the `console` Web API. Invoking
`console.time()` with a label starts a named timer. You can then run the
process you want to time. Then invoke `console.timeEnd()` with the same
label to terminate the timer and see how long the process took.

```javascript
console.time('sorting');
[11,10,9,8,7,6,5,4,3,2,1].sort();
console.timeEnd('sorting');
> sorting: 0.278ms

console.time('console logging');
console.log('logging to the console');
console.timeEnd('console logging');
> logging to the console
> console logging: 0.311ms

console.time('adding'); 1 + 1; console.timeEnd('adding');
> adding: 0.006ms
```

These functions are implemented in most modern browsers.

See [the
docs](https://developer.mozilla.org/en-US/docs/Web/API/Console/time) for
more details.
