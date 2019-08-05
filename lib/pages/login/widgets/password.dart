import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.validator,
    this.controller,
  });

  final FormFieldValidator<String> validator;
  final TextEditingController controller;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isShowPassword,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isShowPassword = !isShowPassword;
            });
          },
          child: Icon(
            isShowPassword ? Icons.visibility : Icons.visibility_off
            // semanticLabel: isShowPassword ? ''
          )
        )
      ),
    );
  }
}