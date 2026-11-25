# Generate Simple SVG Diagram With D2 Lang

[D2](https://d2lang.com/) stands for "Declarative Diagramming".

> A modern language that turns text to diagrams

Here is an example of a file (`mcp.d2`) to render two boxes pointing to one
another representing the interactions between an AI tool with an MCP client and
an MCP server.

```
direction: right

host: AI app (MCP host) {
  client: MCP client
}

server: MCP server

host.client -> server: "tools/list, then tools/call"
server -> host.client: "Tool definitions, then tool result"
```

It starts by declaring the diagram direction of flowing to the right. Then there
is a `host` labeled with "AI app (MCP host)" with `client` (labeled with "MCP
client") nested within. Below that is the second box called `server` is labelled
"MCP server".

Last, the `host.client` points (`->`) to the `server` with a label. And the
`server` points back to `host.client` with another label.

I can render this to SVG by downloading `d2` (`brew install d2`) and then
running the following:

```bash
❯ d2 mcp.d2 mcp.svg
success: successfully compiled mcp.d2 to mcp.svg in 6.788292ms

❯ open mcp.svg
```

Opening the SVG file defaults to my browser which looks like this:

![Diagram of an MCP client inside an AI app host exchanging tool list and tool call requests with an MCP server.](https://cdn.visualmode.dev/images/b021fc2a-mcp-svg-generated-from-d2.png)
