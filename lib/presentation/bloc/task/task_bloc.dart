import 'package:bloc/bloc.dart';
import 'package:task_manager_app/data/database/database_helper.dart';
import 'package:task_manager_app/presentation/bloc/task/task_events.dart';
import 'package:task_manager_app/presentation/bloc/task/task_states.dart';

import '../../../data/repositories/task_repository_impl.dart';
import '../../../domain/repositories/task_repository.dart';
import '../../../domain/use_cases/create_task_usecase.dart';
import '../../../domain/use_cases/delete_task_usecase.dart';
import '../../../domain/use_cases/fetch_tasks_usecase.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  TaskBloc() : super(TasksLoading()) {
    on<LoadTasks>(_fetchTasks);
    on<AddTask>(_createTask);
    on<DeleteTask>(_deleteTask);
  }

  Future<void> _fetchTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(TasksLoading());
    try {
      final TaskRepository repository = TaskRepositoryImpl(DatabaseHelper());
      final tasks = await FetchTasksUseCase(repository).execute();
      emit(TasksLoaded(tasks));
    } catch (e) {
      emit(TaskError("Failed to load tasks"));
    }
  }

  Future<void> _createTask(AddTask event, Emitter<TaskState> emit) async {
    emit(TasksLoading());
    try {
      final TaskRepository repository = TaskRepositoryImpl(DatabaseHelper());

      await CreateTaskUseCase(repository).execute(event.task);
      final tasks = await FetchTasksUseCase(repository).execute();

      emit(TasksLoaded(tasks));
    } catch (e) {
      emit(TaskError("Failed to delete task"));
    }
  }

  Future<void> _deleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    emit(TasksLoading());
    try {
      final TaskRepository repository = TaskRepositoryImpl(DatabaseHelper());

      await DeleteTaskUseCase(repository).execute(event.task);
      await _databaseHelper.deleteTask(event.task.id);
      final tasks = await FetchTasksUseCase(repository).execute();
      emit(TasksLoaded(tasks));
    } catch (e) {
      emit(TaskError("Failed to delete task"));
    }
  }
}
