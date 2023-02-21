# Write A JavaScript Object To A JSON File

To write a JavaScript object to a file as JSON, I need to use two concepts.

First, I need to use
[`JSON.stringify`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify)
to conver the object to a string of valid JSON. Plus, by specifying the third
argument as `2`, I get an indentation of two spaces as it formats the JSON.

```javascript
JSON.stringify(data, null, 2)
```

Second, I need to import the `fs` (filesystem) package so that I can write the
JSON string to a file. In this example, I've chosen to use the synchronous
version
([`writeFileSync`](https://nodejs.org/api/fs.html#fswritefilesyncfile-data-options))
to keep my function simple. There is also an async version.

```javascript
import fs from 'fs'

fs.writeFileSync('my-data.json', json_string, 'utf8')
```

Here is a full example of what this could look like:

```javascript
import fs from 'fs'

const writeJsonToFile = (path, data) => {
  try {
    fs.writeFileSync(path, JSON.stringify(data, null, 2), 'utf8')
    console.log('Data successfully saved to disk')
  } catch (error) {
    console.log('An error has occurred ', error)
  }
}

const data = {
  name: 'Super Software LLC',
  orgIds: [1,3,7,11]
}

writeJsonToFile('my-data.json', data)
```
