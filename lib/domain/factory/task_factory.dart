import '../../dataclass/taskList.dart';

class TaskFactory {
  static TaskItem fromMap(Map<dynamic, dynamic> map, int key) {
    return TaskItem(
      key: key,
      title: map['title'] ?? '',
      content: map['content'] ?? '',
    );
  }
}