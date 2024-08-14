import 'package:counter_block/bloc/task/bloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hello world!'),
        ),
        body: Center(
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state is LoadingTaskState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SuccesTaskState) {
                return ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.items[index].title),
                    );
                  },
                );
              } else if (state is FailureTaskState) {
                return Center(
                  child: Text('Error: ${state.message}'),
                );
              } else {
                return Center(
                  child: Text('Something went wrong'),
                );
              }
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                context.read<TaskBloc>().add(GetTaskEvent());
              },
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.error),
            )
          ],
        ),
      ),
    );
  }
}
