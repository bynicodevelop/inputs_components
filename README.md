# inputs_components

A new plugin created with the Mason CLI.

## Usage

```dart
import 'package:inputs_components/inputs_components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            emailInput(
              label: "Email",
              controller: TextEditingController(),
              textInputAction: TextInputAction.next, /// optional
            ),
            passwordInput(
              label: "Password",
              controller: TextEditingController(),
              customValidator: (value) => value.length > 6, /// optional
            ),
          ],
        ),
      ),
  }
}
```


## Rendering

<img src="https://raw.githubusercontent.com/bynicodevelop/inputs_components/main/example/assets/preview-0.0.1.png" width="320px" />

