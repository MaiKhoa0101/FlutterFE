

import 'package:hive/hive.dart';

import '../models/taskList.dart';

const String taskHiveBox="Task Box";

class HiveFunctions {
  // Box which will use to store the things
  static var taskBox = Hive.box(taskHiveBox);

  // Create or add single data in hive
  static createTask(String title, String content) {
    taskBox.add({
      "title": title,
      "content": content,
    });
  }

  // Get All data  stored in hive
  static List<TaskItem> getAllTask() {
    List<TaskItem> task = [];
    for (var element in taskBox.keys) {
      task.add(TaskItem(
        key: element,
        title: taskBox.get(element)['title'],
        content: taskBox.get(element)['content'],
      )
      );
    }
    return task;
  }

// Get data for particular user in hive
  static TaskItem getTask(int key) {
    return taskBox.get(key);
  }

  static void deleteTask(int key){
    taskBox.delete(key);
  }
  static void deleteAllTask(){
    for (var element in taskBox.keys) {
      taskBox.delete(element);
    }
  }

  static void updateTask(int key, String title, String content) {
    taskBox.put(key, {
      "title": title,
      "content": content,
    }
    );
  }

}