import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:counter_block/enteties/model.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(LoadingTaskState()) {
    on<GetTaskEvent>(gettingTask);
  }

  Future<void> gettingTask(GetTaskEvent event, Emitter<TaskState> emit) async {
    emit(LoadingTaskState());
    try {
      print('Response loading...');
      var url = Uri.https('jsonplaceholder.typicode.com', '/todos');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> dataList = json.decode(response.body);

        List<TaskEntity> items = dataList
            .map((data) => TaskEntity.fromJson(data))
            .toList();

        emit(SuccesTaskState(items: items));
      } else {
        emit(FailureTaskState(message: 'Request failed with status: ${response.statusCode}'));
      }
    } catch (e) {
      print('Error: $e');
      emit(FailureTaskState(message: 'An error occurred: $e'));
    }
  }
}
