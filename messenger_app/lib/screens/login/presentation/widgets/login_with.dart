import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../blocs/login_cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/configs.dart';

class LoginWith extends StatelessWidget {
  const LoginWith({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 820),
      builder: () {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: ScSize.w8,
              child: Row(
                children: const [
                  Expanded(
                    child: Divider(),
                  ),
                  Text(
                    'hoặc đăng nhập với',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<LoginCubit>().onLoginWithGooglePressed().then(
                          (value) =>
                              context.read<LoginCubit>().state is LoginSuccess
                                  ? Navigator.pushNamed(context, Routes.home)
                                  : null,
                        );
                  },
                  child: Image.asset(IconsPath.google),
                ),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: () {
                    context
                        .read<LoginCubit>()
                        .onLoginWithFacebookPressed()
                        .then(
                          (value) =>
                              context.read<LoginCubit>().state is LoginSuccess
                                  ? Navigator.pushNamed(context, Routes.home)
                                      
                                  : null,
                        );
                  },
                  child: Image.asset(IconsPath.facebook),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
