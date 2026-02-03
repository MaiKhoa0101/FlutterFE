import '../../dataclass/taskList.dart';
import '../../domain/factory/task_factory.dart';
import '../service/TaskService.dart';

class TaskRepository {
  final TaskService service;
  TaskRepository(this.service);

  List<TaskItem> getAllTasks() {
    final raw = service.getAllRaw();
    return raw.map((e) => TaskFactory.fromMap(e, e['key'])).toList();
  }

  Future<void> createTask(String title, String content) =>
      service.createTask(title, content);

  Future<void> updateTask(int key, String title, String content) =>
      service.updateTask(key, title, content);

  Future<void> deleteTask(int key) => service.deleteTask(key);

  Future<void> deleteAllTask() => service.deleteAllTask();
}