# Connect To A SQLite Database

Using the `database/sql` module and the `github.com/mattn/go-sqlite3` package,
we can connect to a SQLite database and run some queries. In my case, I have a
SQLite connection string exported to my environment, so I can access that with
`os.Getenv`. It's a local SQLite file, `./test.db`.

Calling `sql.Open`, I'm able to connect with a SQLite3 driver to the database
at that connection string. The `setupDatabase` function returns that database
connection pointer. Things like `Exec` and `QueryRow` can be called on `db`. I
also need to make sure I close the connection to the database with a `defer`.

Here is a full example of connecting to a local SQLite database and inserting a
record:

```go
package main

import (
	"database/sql"
	"fmt"
	"os"

	_ "github.com/mattn/go-sqlite3"
)

func setupDatabase() *sql.DB {
	databaseString := os.Getenv("GOOSE_DBSTRING")
	if len(databaseString) == 0 {
		fmt.Println("Error retrieving `GOOSE_DBSTRING` from env")
		os.Exit(1)
	}
	db, err := sql.Open("sqlite3", databaseString)
	if err != nil {
		fmt.Printf("Error opening database: %v\n", err)
		os.Exit(1)
	}

	return db
}

func main() {
	db := setupDatabase()
	defer db.Close()

	sql := `insert into users (name) values (?);`

	db.Exec(sql, "Josh")
}
```
