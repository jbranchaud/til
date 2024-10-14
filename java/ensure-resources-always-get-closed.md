# Ensure Resources Always Get Closed

Java has a construct known as _try-with-resource_ that allows us to always
ensure opened resources get closed. This is safer than similar cleanup in the
`finally` block which could still leave a memory leak if an error occurs in
that block.

To use the _try-with-resource_ construct, instantiate your opened resource in
parentheses with the `try`.

```java
try (BufferedReader reader = new BufferedReader(new FileReader(filename))) {
  // ...
}
```

The resource will be automatically closed when the try/catch block completes.

Here is a full example:

```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class FileReaderExample {
    public static void main(String[] args) {
        String fileName = "example.txt";
        
        try (BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
            String line;
            int lineCount = 0;
            
            while ((line = reader.readLine()) != null && lineCount < 5) {
                System.out.println(line);
                lineCount++;
            }
        } catch (IOException e) {
            System.out.println("An error occurred while reading the file: " + e.getMessage());
        }
    }
}
```

You can even specify multiple resources in one `try`. The above does that, but
this will make it more obvious:

```java
try (FileReader fr = new FileReader(filename);
     BufferedReader br = new BufferedReader(fr)) {
  // ...
}
```

[source](https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html)
