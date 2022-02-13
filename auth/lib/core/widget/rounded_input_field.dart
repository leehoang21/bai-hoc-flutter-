import 'package:auth/core/widget/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String? errorText;
  final String hintText;
  final IconData icon;
  final Function(String value) onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.icon = Icons.person,
    this.errorText,
  }) : super(key: key);
//tạo mật khẩu
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
          onChanged: (value) => onChanged(value),
          decoration: InputDecoration(
            errorText: errorText,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            prefixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          )),
    );
  }
}
