# Run A Hello World Program In Eclipse

First, you'll need to create a new Java Project if you don't already have one
to work in.

From there, you can add a new _Class_ to the `src` folder of that project. I'll
call mine `Greeting.java` and the only thing it will contain is a `main`
method.

```java
public class Greeting {
    public static void main(String[] args) {
    	String name = args.length > 0 ? args[0] : "World";

        System.out.println("Hello, " + name + "!");
    }
}
```

This method tries to read a name from the arguments given to the program at
time of execution. If one wasn't provided the ternary falls back to `"World"`
as the default name. It then prints the greeting to stdout.

To run this program, we can either select _Run_ from the _Run_ menu (which will
result in `Hello, World!`) or we can select _Run Configurations..._ from the
same menu and add a custom name to _Program Arguments_ under the _Arguments_
tab.
