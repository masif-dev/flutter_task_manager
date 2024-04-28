import '../../data/model/task.dart';
import '../repositories/task_repository.dart';

class FetchTasksUseCase {
  final TaskRepository _repository;

  FetchTasksUseCase(this._repository);

  Future<List<Task>> execute() async {
    return await _repository.getTasks();
  }
}
