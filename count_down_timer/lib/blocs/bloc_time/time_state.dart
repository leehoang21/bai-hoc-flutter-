abstract class TimeState {
  final int time;
  TimeState({required this.time});
}

class InittialState extends TimeState {
  InittialState({required int time}) : super(time: time);
}

class RunningState extends TimeState {
  RunningState({required int time}) : super(time: time);
}

class CompletedState extends TimeState {
  CompletedState() : super(time: 0);
}

class PauseState extends TimeState {
  PauseState({required int time}) : super(time: time);
}
