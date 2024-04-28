import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_app/data/database/database_helper.dart';
import '../lib/data/model/task.dart';
import '../lib/data/repositories/task_repository_impl.dart';
import '../lib/domain/repositories/task_repository.dart';

void main() {
  group('TaskRepository', () {
    test('Add task to repository', () {
      TaskRepository? taskRepository = TaskRepositoryImpl(DatabaseHelper());

      final task =
          Task(id: "12", title: 'Test Task', description: 'Description');
      taskRepository.addTask(task);
      expect(taskRepository.getTasks(), contains(task));
    });

    test('Get all tasks from repository', () {
      TaskRepository? taskRepository = TaskRepositoryImpl(DatabaseHelper());

      final tasks = [
        Task(
            id: "8181c472-b8c7-456c-9bcd-3f403005a74c",
            title: 'helo',
            description: 'app',
            isDone: false)
      ];
      tasks.forEach((task) => taskRepository.addTask(task));
      expect(taskRepository.getTasks(), equals(tasks));
    });

    test('Delete task from repository', () {
      TaskRepository? taskRepository = TaskRepositoryImpl(DatabaseHelper());

      final task =
          Task(id: "122", title: 'Test Task', description: 'Description');
      taskRepository.addTask(task);
      taskRepository.deleteTask(task);
      expect(taskRepository.getTasks(), isNot(contains(task)));
    });
  });
}
