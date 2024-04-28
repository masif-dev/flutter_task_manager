import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../data/model/task.dart';
import '../bloc/task/task_bloc.dart';
import '../bloc/task/task_events.dart';

class CreateTaskScreen extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _taskDescController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _taskController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    border: fieldBorder(),
                    enabledBorder: fieldBorder(),
                    focusedBorder: fieldBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter task title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _taskDescController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    border: fieldBorder(),
                    enabledBorder: fieldBorder(),
                    focusedBorder: fieldBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter task description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        BorderRadius.circular(6), // Adjust the radius as needed
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<TaskBloc>().add(AddTask(Task(
                              id: Uuid().v4(),
                              title: _taskController.text,
                              description: _taskDescController.text,
                              isDone: false,
                            )));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder fieldBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    );
  }
}
