class Countdown {
  int time;
  static const Duration _period = Duration(seconds: 1);

  Countdown({required this.time});

  Stream<int> get countdown => Stream<int>.periodic(_period, (i) {
        return time = time - i - 1;
      }).take(time);
}
