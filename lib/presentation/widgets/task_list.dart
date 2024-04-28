import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/data/model/task.dart';

import '../bloc/task/task_bloc.dart';
import 'delete_task.dart';

class TaskListWidget extends StatelessWidget {
  final List<Task> tasks;

  TaskListWidget({required this.tasks});

  @override
  Widget build(BuildContext context) {
    final TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                  elevation: 0.5,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 15.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          task.description,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  )),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  showDeleteConfirmationDialog(task, context);
                },
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: const Center(
                      child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  )),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
