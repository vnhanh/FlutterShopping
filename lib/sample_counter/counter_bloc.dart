import 'package:bloc/bloc.dart';
import 'package:shopping/sample_counter/counter_event.dart';

import 'package:shopping/sample_counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(Success(0)) {
    on<CounterIncrement>(_onIncrement);
  }

  CounterState get initialState => Success(0);
  int count = 0;

  void _onIncrement(
    CounterIncrement event,
    Emitter<CounterState> emitter,
  ) {
    emitter(
        Success(++count)
    );
  }
}
