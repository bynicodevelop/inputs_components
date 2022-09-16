import 'package:flutter/material.dart';
import 'package:inputs_components/components/inputs/email_input_component.dart';
import 'package:inputs_components/components/inputs/password_input_component.dart';

Widget emailInput({
  required String label,
  required TextEditingController controller,
  TextInputAction textInputAction = TextInputAction.next,
  Function(String value)? customValidator,
}) =>
    EmailInputComponent(
      label: label,
      controller: controller,
      textInputAction: textInputAction,
      customValidator: customValidator,
    );

Widget passwordInput({
  required String label,
  required TextEditingController controller,
  TextInputAction textInputAction = TextInputAction.done,
  Function(String value)? customValidator,
}) =>
    PasswordInputComponent(
      label: label,
      controller: controller,
      textInputAction: textInputAction,
      customValidator: customValidator,
    );
