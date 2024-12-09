# Add A Method To A Struct

Given a `struct` in Go, we can attach a method to that struct. Put another way,
we can define a method whose receiver is that struct. Then with an instance of
that struct, we can call the method.

Let's say we are modeling a turtle that can move around a 2D grid. A turtle has
a heading (the direction it is headed) and a location (its current X,Y
coordinate).

```go
type Heading string

const (
	UP    Heading = "UP"
	RIGHT Heading = "RIGHT"
	DOWN  Heading = "DOWN"
	LEFT  Heading = "LEFT"
)

type Turtle struct {
	Direction Heading
	X         int
	Y         int
}
```

We can then add a method like so by specifying the receiver as the first part
of the declaration:

```go
func (turtle *Turtle) TurnRight() {
	switch turtle.Direction {
	case UP:
		turtle.Direction = RIGHT
	case RIGHT:
		turtle.Direction = DOWN
	case DOWN:
		turtle.Direction = LEFT
	case LEFT:
		turtle.Direction = UP
	}
}
```

The receiver is a pointer to a `Turtle`. The method is called `TurnRight`.
There are no parameters or return values.

Here are a sequence of calls to demonstrate how it works:

```go
func main() {
	turtle := Turtle{UP, 5, 5}

	fmt.Println("Turtle Direction:", turtle.Direction)
	//=> Turtle Direction: UP

	turtle.TurnRight()

	fmt.Println("Turtle Direction:", turtle.Direction)
	//=> Turtle Direction: RIGHT

	turtle.TurnRight()

	fmt.Println("Turtle Direction:", turtle.Direction)
	//=> Turtle Direction: DOWN
}
```

[source](https://go.dev/tour/methods/1)
