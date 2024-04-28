import '../../data/model/task.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);

  Future<List<Task>> getTasks();

  Future<void> deleteTask(Task task);
}
