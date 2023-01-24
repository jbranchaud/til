# Check If File Exists Before Reading It

Let's say we are working on a script that tries to read in existing data from a
JSON data file. It is possible that data file hasn't been created and populated
yet. In order to account for that scenario, we need to check if the file
exists. If we try to read from a non-existant file, an error will be thrown.

To prevent the script from error'ing out, we can use
[`fs.existsSync`](https://nodejs.org/api/fs.html#fsexistssyncpath) to check if
the given file path is an existing file. If we learn that the file does exist,
we can proceed with reading it. If not, we can skip the file read and react
accordingly.

```javascript
import fs from 'fs'

const nonExistantFile = 'non-existant.json'

// set default in case file does not exists
let json = {}

if(fs.existsSync(nonExistantFile)) {
  const fileData = fs.readFileSync(nonExistantFile)
  json = JSON.parse(fileData.toString())
}

console.log('JSON: ', json)
```

[source](https://flaviocopes.com/how-to-check-if-file-exists-node/)
