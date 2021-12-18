import 'dart:async';

class TestStream {
  static const int initied = 0;
  int _counter = 0;
  final _stream = StreamController<int>.broadcast();
  Stream<int> get counterStream => _stream.stream;

  void increment() {
    _counter++;
    _stream.sink.add(_counter);
  }

  void dispose() {
    _stream.close();
  }
}
