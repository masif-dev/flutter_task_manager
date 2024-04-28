import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/task/task_bloc.dart';
import '../bloc/task/task_events.dart';
import '../bloc/task/task_states.dart';
import '../widgets/task_list.dart';
import 'create_task.dart';

class TaskManager extends StatefulWidget {
  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(LoadTasks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TasksLoaded) {
              return state.tasks.isEmpty
                  ? const Center(
                      child: Text("Sorry, No task found"),
                    )
                  : TaskListWidget(
                      tasks: state.tasks,
                    );
            } else if (state is TasksLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TaskError) {
              return Center(
                child: Text('Error loading tasks: ${state.message}'),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateTaskScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
