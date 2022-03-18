import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

abstract class CounterState {
  final int counter;
  const CounterState(this.counter);
}

class InitialState extends CounterState {
  const InitialState() : super(0);
}

class IncrementState extends CounterState {
  const IncrementState(int counter) : super(counter);
}

class DecrementState extends CounterState {
  const DecrementState(int counter) : super(counter);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const InitialState()) {
    on<IncrementEvent>((event, emit) {
      emit(IncrementState(state.counter + 1));
    });

    on<DecrementEvent>((event, emit) {
      emit(DecrementState(state.counter - 1));
    });
  }
}
