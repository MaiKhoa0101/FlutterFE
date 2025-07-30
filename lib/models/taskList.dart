import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class TaskItem {

  int? key;

  @HiveField(0)
  String title;

  @HiveField(1)
  String content;


  TaskItem({
    this.key,
    required this.title,
    required this.content,
  });
}


