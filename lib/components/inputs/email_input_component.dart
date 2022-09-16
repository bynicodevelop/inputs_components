import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class EmailInputComponent extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final Function(String value)? customValidator;

  const EmailInputComponent({
    super.key,
    required this.label,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    this.customValidator,
  });

  @override
  State<EmailInputComponent> createState() => _EmailInputComponentState();
}

class _EmailInputComponentState extends State<EmailInputComponent> {
  final FocusNode _focusNode = FocusNode();
  bool _isEmailValid = true;

  bool _validateEmail(String value) {
    if (widget.customValidator != null) {
      return widget.customValidator!(value);
    }

    return isEmail(value);
  }

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus && widget.controller.text.isNotEmpty) {
        setState(
          () => _isEmailValid = _validateEmail(widget.controller.text),
        );
      } else {
        if (widget.controller.text.isNotEmpty) {
          setState(
            () => _isEmailValid = _validateEmail(widget.controller.text),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      textInputAction: widget.textInputAction,
      keyboardType: TextInputType.emailAddress,
      key: Key(widget.label.toLowerCase()),
      decoration: InputDecoration(
        hintText: widget.label,
        errorText: _isEmailValid ? null : "Invalid email",
      ),
    );
  }
}
