import 'package:flutter/material.dart';
import 'package:messenger_app/config/configs.dart';

class PushLogin extends StatelessWidget {
  const PushLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Đã có tài khoản? ",
          style: TextStyle(color: Colors.grey),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.login);
          },
          child: const Text(
            "Đăng nhập",
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
