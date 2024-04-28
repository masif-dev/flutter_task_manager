import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/task.dart';
import '../bloc/task/task_bloc.dart';
import '../bloc/task/task_events.dart';

void showDeleteConfirmationDialog(Task task, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        title: const Text('Delete Task'),
        content: Text('Are you sure you want to delete ${task.title} task?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);
              taskBloc.add(DeleteTask(task));
              Navigator.of(context).pop();
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
