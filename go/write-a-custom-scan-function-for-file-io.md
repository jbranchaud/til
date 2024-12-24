# Write A Custom Scan Function For File IO

By default a [`bufio.Scanner`](https://pkg.go.dev/bufio#Scanner) will scan
input line-by-line. In other words, splitting on newlines such that each
iteration will emit everything up to the next newline character.

We can write our own `SplitFunc` and override the default one by calling
`scanner.Split` with it. Our custom scan function needs to match the type
signature of [`SplitFunc`](https://pkg.go.dev/bufio#SplitFunc).

Here is a custom one that emits each individual character but omits the
newlines.

```go
func ScanChar(data []byte, atEOF bool) (int, []byte, error) {
	if atEOF || len(data) == 0 {
		return 0, nil, nil
	}

	start := 0
	for start < len(data) {
		if !utf8.FullRune(data[start:]) {
			return 0, nil, nil
		}

		r, size := utf8.DecodeRune(data[start:])
		if r == utf8.RuneError {
			return 0, nil, fmt.Errorf("invalid UTF-8 encoding")
		}

		if r != '\n' {
			return start + size, data[start:start+size], nil
		}

		// found a \n, advance the start position
		start += size
	}

	return start, nil, nil
}
```

We can then use thi `ScanChar` function with a `bufio.Scanner` like so:

```go
func ReadFileByCharacter(file io.Reader) {
	scanner := bufio.NewScanner(file)

	// override default SplitFunc
	scanner.Split(scanChar)

	for scanner.Scan() {
		char := scanner.Text()

		fmt.Printf("- %s\n", char)
	}
}
```
