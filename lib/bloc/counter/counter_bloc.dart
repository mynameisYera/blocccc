import 'package:counter_block/bloc/counter/user_event.dart';
import 'package:counter_block/bloc/counter/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(const ValueCounterState(value: 5)) {
    on<AddintionCounterEvent>((event, emit) {
      final currentState = state as ValueCounterState;
      emit(ValueCounterState(value: currentState.value + 1));
    });
  }
}