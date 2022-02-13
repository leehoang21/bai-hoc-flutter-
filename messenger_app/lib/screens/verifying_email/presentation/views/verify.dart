import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/config/configs.dart';
import 'package:messenger_app/injector.dart';
import 'verify_view.dart';
import '../../verify.dart';
import '/core/widget/back_ground.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<VerifyCubit>(),
      child: Background(
        image: Image.asset(IconsPath.verify),
        text: 'Verify',
        child: const VerifyView(),
      ),
    );
  }
}
