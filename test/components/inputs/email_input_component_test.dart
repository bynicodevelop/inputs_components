import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inputs_components/components/inputs/email_input_component.dart';

void main() {
  testWidgets(
      'Verify error message not display when text is empty and text field have focus',
      (WidgetTester tester) async {
    final TextEditingController controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmailInputComponent(
            label: 'Email',
            controller: controller,
          ),
        ),
      ),
    );

    final Finder textField = find.byType(TextField);
    await tester.tap(textField);

    await tester.pumpAndSettle();

    expect(find.text('Invalid email'), findsNothing);
  });

  testWidgets("Verify error message display when lose focus",
      (WidgetTester tester) async {
    final TextEditingController controller = TextEditingController(
      text: 'email',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmailInputComponent(
            label: 'Email',
            controller: controller,
          ),
        ),
      ),
    );

    final Finder textField = find.byType(TextField);
    await tester.tap(textField);

    await tester.pumpAndSettle();

    await tester.tapAt(Offset.zero);

    await tester.pumpAndSettle();

    expect(find.text('Invalid email'), findsOneWidget);
  });

  testWidgets(
      "Verify error message display when lose focus with custom validator",
      (WidgetTester tester) async {
    bool hasError = false;
    final TextEditingController controller = TextEditingController(
      text: "test",
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmailInputComponent(
            label: 'Email',
            controller: controller,
            customValidator: (value) => value.length > 6,
            onErrors: () => hasError = true,
          ),
        ),
      ),
    );

    final textField = find.byType(TextField);

    await tester.tap(textField);

    await tester.pumpAndSettle();

    await tester.tapAt(Offset.zero);

    await tester.pumpAndSettle();

    expect(find.text('Invalid email'), findsOneWidget);

    expect(hasError, true);
  });
}
