import 'animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocAnimation extends Bloc<AnimationEvent, AnimationState> {
  static const double _initialPosition = 0.35;
  static const int _initialCount = 3;

  BlocAnimation()
      : super(AnimationInitialState(
          position: _initialPosition,
          count: _initialCount,
        )) {
    on<ClickArrowBackEvent>((event, emit) {
      emit(ClickArrowBackState(position: state.position - 1, count: 3));
    });
    on<ClickArrowForwardEvent>((event, emit) {
      emit(ClickArrowBackState(position: state.position + 1, count: 3));
    });
  }
}
