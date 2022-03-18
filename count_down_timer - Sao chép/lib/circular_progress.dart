import 'package:count_down_timer/blocs/bloc_time/time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.6),
      child: Container(
        width: 158,
        height: 158,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: CircularProgressIndicator(
          strokeWidth: 7,
          value: context.watch<TimeBloc>().progress,
          backgroundColor: Colors.white,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
        ),
      ),
    );
  }
}
