import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable{
  const CounterState();

  @override
  List<Object> get props => [];
}

class ValueCounterState extends CounterState{
  final int value;

  const ValueCounterState({required this.value});
  @override
  List<Object> get props => [value];
}