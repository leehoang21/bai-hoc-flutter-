import 'dart:async';
import 'countdown.dart';
import 'time.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeBloc extends Bloc<TimerEvent, TimeState> {
  static const int _initialTime = 180;
  late StreamSubscription<int> _timeSubcription;
  String _time = '';
  double _progress = 180;

  get progress => _progress;

  TimeBloc() : super(InittialState(time: _initialTime)) {
    on<StartEvent>((event, emit) {
      emit(RunningState(time: event.time));
      _timeSubcription.cancel();
      _timeSubcription = Countdown(time: event.time).countdown.listen(
        (duration) {
          add(RunEvent(time: duration));
          _progress = duration / _initialTime;
        },
      );
    });

    on<RunEvent>((event, emit) {
      if (event.time > 0) {
        emit(RunningState(time: event.time));
        _time = state.time.toString().split(".").first;
      } else {
        emit(CompletedState());
        _time = 'completed';
      }
    });

    on<PauseEvent>((event, emit) {
      _timeSubcription.pause();
      emit(PauseState(time: state.time));
    });

    on<ResumeEvent>((event, emit) {
      _timeSubcription.resume();
      emit(RunningState(time: state.time));
    });

    on<StopEvent>((event, emit) {
      _timeSubcription.cancel();
      emit(InittialState(time: _initialTime));
    });
  }

  String get time => _time;
}
