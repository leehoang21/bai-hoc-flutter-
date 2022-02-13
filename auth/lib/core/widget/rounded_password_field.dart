import 'package:auth/core/widget/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final String? errorText;
  final bool obscureText;
  final Function(BuildContext context) onPressed;
  const RoundedPasswordField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.errorText,
    required this.obscureText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: (pass) => onChanged(pass),
        obscureText: obscureText,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          errorText: errorText,
          hintText: hintText,
          prefixIcon: const Icon(
            Icons.lock,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            color: Colors.grey,
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () => onPressed(context),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
