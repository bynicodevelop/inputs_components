import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inputs_components/components/inputs/password_input_component.dart';

void main() {
  testWidgets("Verify text editing controller", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PasswordInputComponent(
            label: "Password",
            controller: TextEditingController(
              text: "test",
            ),
          ),
        ),
      ),
    );

    final textField = find.byType(TextField);

    final textFieldWidget = tester.widget<TextField>(textField);

    expect(textFieldWidget.controller!.text, "test");
  });

  testWidgets("Verify new value in text editing controller", (
    WidgetTester tester,
  ) async {
    final TextEditingController controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PasswordInputComponent(
            label: "Password",
            controller: controller,
          ),
        ),
      ),
    );

    final textField = find.byType(TextField);

    await tester.enterText(textField, "test");

    expect(controller.text, "test");
  });

  testWidgets("Verify switch obscure text when user click on suffix icon", (
    WidgetTester tester,
  ) async {
    final TextEditingController controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PasswordInputComponent(
            label: "Password",
            controller: controller,
          ),
        ),
      ),
    );

    final textField = find.byType(TextField);

    final textFieldWidget = tester.widget<TextField>(textField);
    final iconEyeVisibliltyWidget =
        textFieldWidget.decoration!.suffixIcon! as IconButton;
    final iconEyeVisiblity = iconEyeVisibliltyWidget.icon as Icon;

    expect(textFieldWidget.obscureText, true);
    expect(iconEyeVisiblity.icon, Icons.visibility);

    await tester.tap(find.byType(IconButton));

    await tester.pump();

    final newTextFieldWidget = tester.widget<TextField>(textField);
    final iconEyeCloseWidget =
        newTextFieldWidget.decoration!.suffixIcon! as IconButton;
    final iconEyeClose = iconEyeCloseWidget.icon as Icon;

    expect(newTextFieldWidget.obscureText, false);
    expect(iconEyeClose.icon, Icons.visibility_off);
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
          body: PasswordInputComponent(
            label: 'Password',
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

    expect(find.text('Invalid password'), findsOneWidget);

    expect(hasError, true);
  });
}
