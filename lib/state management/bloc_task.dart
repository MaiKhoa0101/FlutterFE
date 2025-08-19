import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/taskList.dart';
import '../data/repository/HiveRepository.dart';

abstract class TaskEvent {}
class LoadTasks extends TaskEvent {}
class AddTask extends TaskEvent {
  final String title, content;
  AddTask(this.title, this.content);
}
class UpdateTask extends TaskEvent {
  final int key;
  final String title, content;
  UpdateTask(this.key, this.title, this.content);
}
class DeleteTask extends TaskEvent {
  final int key;
  DeleteTask(this.key);
}
class DeleteAllTasks extends TaskEvent {}

abstract class TaskState {}
class TaskInitial extends TaskState {}
class TaskLoading extends TaskState {}
class TaskLoaded extends TaskState {
  final List<TaskItem> tasks;
  TaskLoaded(this.tasks);
}
class TaskError extends TaskState {
  final String message;
  TaskError(this.message);
}

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository;
  TaskBloc(this.repository) : super(TaskInitial()) {
    on<LoadTasks>((event, emit) {
      emit(TaskLoading());
      try {
        final tasks = repository.getAllTasks();
        emit(TaskLoaded(tasks));
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });

    on<AddTask>((event, emit) async {
      await repository.createTask(event.title, event.content);
      add(LoadTasks());
    });

    on<UpdateTask>((event, emit) async {
      await repository.updateTask(event.key, event.title, event.content);
      add(LoadTasks());
    });

    on<DeleteTask>((event, emit) async {
      await repository.deleteTask(event.key);
      add(LoadTasks());
    });

    on<DeleteAllTasks>((event, emit) async {
      await repository.deleteAllTask();
      add(LoadTasks());
    });
  }
}