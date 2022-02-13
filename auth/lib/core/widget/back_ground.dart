import 'package:auth/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

const imagesBgLogin = AssetImage(ImagesPath.login);

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(imagesBgLogin, context);
    return ScreenUtilInit(
      designSize: const Size(411, 820),
      builder: () {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: imagesBgLogin,
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0, -0.8),
                child: Image.asset(
                  IconsPath.home,
                ),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: Align(
                  alignment: const Alignment(0, 0.5),
                  child: Container(
                    width: ScSize.w * 0.9,
                    height: ScSize.h * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
