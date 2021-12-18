import 'package:count_down_timer/blocs/bloc_time/time.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Alignment alignment;
  final TimerEvent event;
  final String text;
  const Button(
      {Key? key,
      required this.event,
      required this.text,
      required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: FloatingActionButton(
        onPressed: () => TimeBloc().add(event),
        child: Text(text),
      ),
    );
  }
}
