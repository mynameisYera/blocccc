part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class SuccesTaskState extends TaskState {
  final List<TaskEntity> items;

  SuccesTaskState({required this.items});

  @override
  List<Object> get props => [items];
}

final class LoadingTaskState extends TaskState {}

final class FailureTaskState extends TaskState {
  final String message;

  FailureTaskState({required this.message});

  @override
  List<Object> get props => [message];
}
