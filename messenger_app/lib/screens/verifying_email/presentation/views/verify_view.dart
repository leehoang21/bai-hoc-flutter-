import 'dart:async';

import 'package:flutter/material.dart';
import 'package:messenger_app/config/configs.dart';
import '../blocs/cutbits/verify/verify_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyView extends StatefulWidget {
  const VerifyView({Key? key}) : super(key: key);

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  late StreamSubscription subscription;
  @override
  void initState() {
    context.read<VerifyCubit>().send().then((value) {
      subscription = Stream.periodic(
        const Duration(seconds: 3),
        (time) {
          context.read<VerifyCubit>().checkVeriied().then((value) {
            if (context.read<VerifyCubit>().state.isSuccess) {
              Navigator.pushNamed(context, Routes.login);
              subscription.cancel();
            }
          });
        },
      ).listen((event) {});
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Text(
      '''Email has been sent to your email address.
       Please verify your email to continue.''',
    );
  }
}
