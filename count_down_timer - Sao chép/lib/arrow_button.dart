import 'package:count_down_timer/blocs/bloc_animation_images/animation.dart';
import 'package:count_down_timer/blocs/bloc_time/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowButton extends StatelessWidget {
  final Icon icon;
  final bool isRight;
  const ArrowButton({
    Key? key,
    required this.icon,
    required this.isRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        return Positioned(
          top: ScreenUtil().screenHeight * 0.3,
          right: isRight ? 10 : null,
          left: isRight ? null : 10,
          child: IconButton(
            onPressed: onPressed(state),
            icon: icon,
          ),
        );
      },
    );
  }

  onPressed(state) {
    var _isStarting = state is InittialState;
    var _isBackState = state is ClickArrowBackState;
    var _isForwardState = state is ClickArrowForwardState;
    if (_isBackState && _isStarting) {
      BlocAnimation().add(ClickArrowBackEvent());
    } else if (_isForwardState && _isStarting) {
      BlocAnimation().add(ClickArrowForwardEvent());
    }
  }
}
