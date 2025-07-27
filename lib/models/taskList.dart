import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class TaskItem{
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  TaskItem({
    required this.title,
    required this.content
  });
}

