import '../../data/model/task.dart';
import '../repositories/task_repository.dart';

class CreateTaskUseCase {
  final TaskRepository _repository;

  CreateTaskUseCase(this._repository);

  Future<void> execute(Task task) async {
    await _repository.addTask(task);
  }
}
