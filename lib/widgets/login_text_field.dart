import 'package:chat_apps/utils/textfield_styles.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool hasAsterisk;
  const LoginTextField({Key? key, required this.controller, required this.hintText, this.validator, this.hasAsterisk = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hasAsterisk,
      validator: (value) {
        if (validator!=null)
        return validator!(value);
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: '$hintText',
        hintStyle: ThemeTextStyle.loginTextFieldStyle,
        border: OutlineInputBorder(),
      ),
    );
  }
}
