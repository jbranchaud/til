# Avoid The Notch With SafeAreaView

iOS devices, especially the iPhone X, have areas of the screen that are cut
off in ways that present quite a challenge to developers. One of the easiest
ways to deal with rounded corners and the notch when developing for iOS is
to avoid them all together.

> The purpose of `SafeAreaView` is to render content within the safe area
> boundaries of a device.

```javascript
import { SafeAreaView, View, Text } from 'react-native';

const App = () => {
  return (
    <SafeAreaView style={{ flex: 1, backgroundColor: "#e6e6e6" }}>
      <View>
        <Text>Safely rendered in the visible area of the device!</Text>
      </View>
    </SafeAreaView>
  );
}
```

The _unsafe_ area can be styled however you like and everything inside
`<SafeAreaView>` will be pushed into the visible area of the screen.

h/t Dillon Hafer

[source](https://facebook.github.io/react-native/docs/safeareaview.html)
