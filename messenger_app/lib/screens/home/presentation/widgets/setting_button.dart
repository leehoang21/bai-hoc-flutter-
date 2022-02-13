import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingButton extends StatelessWidget {
  final Function(BuildContext context) onPressed;
  final Color colors;
  final String funcionName;
  final IconData icons;
  const SettingButton({
    Key? key,
    required this.onPressed,
    this.colors = Colors.black,
    required this.funcionName,
    this.icons = Icons.arrow_forward_ios,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        onPressed: () => onPressed(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              funcionName,
              style: TextStyle(
                color: colors,
                fontSize: 25,
              ),
            ),
            Icon(
              icons,
              color: colors,
            ),
          ],
        ),
      ),
    );
  }
}
