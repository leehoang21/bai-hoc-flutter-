import 'blocs/bloc_time/time.dart';
import 'button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeButton extends StatelessWidget {
  const TimeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeBloc, TimeState>(
      builder: (context, state) {
        if (state is InittialState) {
          return Button(
            alignment: const Alignment(0, 0.9),
            event: StartEvent(time: state.time),
            text: 'play',
          );
        } else if (state is RunningState) {
          return Column(
            children: [
              Button(
                event: PauseEvent(),
                text: 'pause',
                alignment: const Alignment(-0.5, 0.9),
              ),
              Button(
                event: StopEvent(),
                text: 'stop',
                alignment: const Alignment(0.5, 0.9),
              ),
            ],
          );
        } else if (state is PauseState) {
          return Column(
            children: [
              Button(
                event: ResumeEvent(),
                text: 'pause',
                alignment: const Alignment(-0.5, 0.9),
              ),
              Button(
                event: StopEvent(),
                text: 'stop',
                alignment: const Alignment(0.5, 0.9),
              ),
            ],
          );
        } else if (state is CompletedState) {
          return Button(
            alignment: const Alignment(0, 0.9),
            event: StartEvent(time: state.time),
            text: 'completed',
          );
        }
        return const Text('data');
      },
    );
  }
}
