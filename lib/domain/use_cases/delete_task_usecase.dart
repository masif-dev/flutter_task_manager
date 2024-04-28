import '../../data/model/task.dart';
import '../repositories/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository _repository;

  DeleteTaskUseCase(this._repository);

  Future<void> execute(Task task) async {
    await _repository.deleteTask(task);
  }
}
