import 'package:hive/hive.dart';

class TaskService {
  final String boxName = 'Task Box';

  Box get box => Hive.box(boxName);

  List<Map<dynamic, dynamic>> getAllRaw() {
    return box.keys.map((key) {
      final value = box.get(key);
      return {'key': key, ...Map<String, dynamic>.from(value)};
    }).toList();
  }

  Future<void> createTask(String title, String content) async {
    await box.add({'title': title, 'content': content});
  }

  Future<void> updateTask(int key, String title, String content) async {
    await box.put(key, {'title': title, 'content': content});
  }

  Future<void> deleteTask(int key) async {
    await box.delete(key);
  }

  Future<void> deleteAllTask() async {
    await box.clear();
  }
}