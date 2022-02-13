import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_app/config/configs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cubit/home_cubit.dart';
import '../widgets/setting_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(411, 820),
        builder: () {
          return Scaffold(
            body: SizedBox.fromSize(
              size: Size(ScSize.w * 0.9, ScSize.h * 0.7),
              child: Column(
                verticalDirection: VerticalDirection.up,
                children: [
                  Text(
                    context.read<HomeCubit>().state is LogOutError
                        ? context.watch<HomeCubit>().state.error!
                        : '',
                  ),
                  context.read<HomeCubit>().state is LogOutLoading
                      ? const CircularProgressIndicator()
                      : const Text(''),

                  SettingButton(
                    onPressed: (context) {
                      context.read<HomeCubit>().logout().then((value) {
                        if (context.read<HomeCubit>().state is LogOutSuccess) {
                          Navigator.pushNamed(context, Routes.login);
                        }
                      });
                    },
                    icons: Icons.logout_outlined,
                    funcionName: 'Đăng Xuất',
                    colors: Colors.red,
                  ),
                  // SettingButton(
                  //   onPressed: (context) {},
                  //   funcionName: 'Theme',
                  // ),
                  // SettingButton(
                  //   onPressed: (context) {},
                  //   funcionName: 'Ngôn ngữ',
                  // ),
                  // SettingButton(
                  //   onPressed: (context) {},
                  //   funcionName: 'Tài khoản và bảo mật',
                  // ),
                  // SettingButton(
                  //   onPressed: (context) {},
                  //   funcionName: 'Thông tin cá nhân',
                  // ),
                ],
              ),
            ),
          );
        });
  }
}
