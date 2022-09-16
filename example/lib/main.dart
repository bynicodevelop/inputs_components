import 'package:flutter/material.dart';
import 'package:inputs_components/inputs_components.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

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
            ),
            passwordInput(
              label: "Password",
              controller: TextEditingController(),
              customValidator: (value) => value.length > 6,
            ),
          ],
        ),
      ),
    );
  }
}
