import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/presentation/bloc/task/task_bloc.dart';
import 'package:task_manager_app/presentation/pages/tasks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskBloc>(
        create: (context) => TaskBloc(),
        child: MaterialApp(
          title: 'Task Manager',
          home: TaskManager(),
        ));
  }
}
