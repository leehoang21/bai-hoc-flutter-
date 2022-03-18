abstract class TimerEvent {}

class StartEvent extends TimerEvent {
  final int time;

  StartEvent({required this.time});
}

class RunEvent extends TimerEvent {
  final int time;

  RunEvent({required this.time});
}

class PauseEvent extends TimerEvent {}

class ResumeEvent extends TimerEvent {}

class StopEvent extends TimerEvent {}
