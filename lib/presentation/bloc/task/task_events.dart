import 'package:equatable/equatable.dart';
import 'package:task_manager_app/data/model/task.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final Task task;

  AddTask(this.task);

  @override
  List<Object?> get props => [task];
}

class ToggleTask extends TaskEvent {
  final Task task;

  ToggleTask(this.task);

  @override
  List<Object?> get props => [task];
}

class DeleteTask extends TaskEvent {
  final Task task;

  DeleteTask(this.task);

  @override
  List<Object?> get props => [task];
}
