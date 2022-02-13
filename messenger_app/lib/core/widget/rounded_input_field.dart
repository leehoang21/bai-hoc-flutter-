import 'package:flutter/material.dart';
import 'package:messenger_app/core/widget/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController userController;
  final String? errorText;
  final String hintText;
  final IconData icon;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    this.errorText,
    required this.userController,
  }) : super(key: key);
//tạo mật khẩu
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
          controller: userController,
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
