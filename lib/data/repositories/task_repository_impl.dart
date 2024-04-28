import 'package:task_manager_app/data/model/task.dart';

import '../../domain/repositories/task_repository.dart';
import '../database/database_helper.dart';

class TaskRepositoryImpl implements TaskRepository {
  final DatabaseHelper _database;

  TaskRepositoryImpl(this._database);

  @override
  Future<void> addTask(Task task) async {
    await _database.insertTask(task);
  }

  @override
  Future<List<Task>> getTasks() async {
    final tasks = await _database.getTasks();
    return tasks;
  }

  @override
  Future<void> deleteTask(Task task) async {
    await _database.deleteTask(task.id);
  }
}
