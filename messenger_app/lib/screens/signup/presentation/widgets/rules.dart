import 'package:flutter/material.dart';
import 'package:messenger_app/config/configs.dart';

class Rules extends StatelessWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {},
        ),
        const Text('Tôi đã đọc kĩ '),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.rules);
          },
          child: const Text(
            'điều khoản',
            style: TextStyle(color: Colors.green),
          ),
        ),
        const Text(' sử dụng'),
      ],
    );
  }
}
