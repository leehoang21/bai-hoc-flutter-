import 'package:flutter/material.dart';
import 'package:messenger_app/config/configs.dart';

class PushSignup extends StatelessWidget {
  const PushSignup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Chưa có tài khoản? ",
          style: TextStyle(color: Colors.grey),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.signup);
          },
          child: const Text(
            "Đăng ký",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
