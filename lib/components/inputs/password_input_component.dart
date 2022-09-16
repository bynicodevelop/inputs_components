import 'package:flutter/material.dart';

class PasswordInputComponent extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final Function(String value)? customValidator;
  final Function()? onErrors;

  const PasswordInputComponent({
    super.key,
    required this.label,
    required this.controller,
    this.textInputAction = TextInputAction.done,
    this.customValidator,
    this.onErrors,
  });

  @override
  State<PasswordInputComponent> createState() => _PasswordInputComponentState();
}

class _PasswordInputComponentState extends State<PasswordInputComponent> {
  final FocusNode _focusNode = FocusNode();
  bool _obscureText = true;
  bool _isPasswordValid = true;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (widget.customValidator == null) return;

      if (_focusNode.hasFocus && widget.controller.text.isNotEmpty) {
        setState(
          () => _isPasswordValid =
              widget.customValidator!(widget.controller.text),
        );
      } else {
        if (widget.controller.text.isNotEmpty) {
          setState(
            () => _isPasswordValid =
                widget.customValidator!(widget.controller.text),
          );
        }
      }

      if (widget.onErrors != null) {
        widget.onErrors!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      textInputAction: widget.textInputAction,
      keyboardType: TextInputType.visiblePassword,
      autocorrect: false,
      key: Key(widget.label.toLowerCase()),
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.label,
        errorText: _isPasswordValid ? null : "Invalid password",
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () => setState(
            () => _obscureText = !_obscureText,
          ),
        ),
      ),
    );
  }
}
