import 'package:flutter/material.dart';
import 'package:messenger_app/core/widget/widget.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController passController;
  final String hintText;
  final String? errorText;
  final bool obscureText;
  final Function(BuildContext context) onPressed;
  const RoundedPasswordField({
    Key? key,
    required this.hintText,
    required this.errorText,
    required this.obscureText,
    required this.onPressed,
    required this.passController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: passController,
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
