import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../hive/hivefunction.dart';
import '../../models/taskList.dart';

class DetailTask extends StatefulWidget {
  final TaskItem item;

  const DetailTask({super.key, required this.item});

  @override
  State<DetailTask> createState() => _DetailTaskState();
}

class _DetailTaskState extends State<DetailTask> {
  late TaskItem task;
  late TextEditingController titleController;
  late TextEditingController contentController;
  bool isEditing = true;
  bool isUpdated = false;

  @override
  void initState() {
    super.initState();
    task = widget.item;
    titleController = TextEditingController(text: task.title);
    contentController = TextEditingController(text: task.content);
  }

  void toggleEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void saveChanges() {
    task.title = titleController.text;
    task.content = contentController.text;
    HiveFunctions.updateTask(task.key!, task.title, task.content);
    setState(() {
      isEditing = false;
      isUpdated = true;
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Chi tiết công việc"),
      backgroundColor: Colors.green,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => context.pop(isUpdated), // Trả về kết quả
      ),
    );
  }

  Widget _buildBody() {
    return
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child:Column(
        children: [
          _buildTextField(titleController, "Tiêu đề"),
          const SizedBox(height: 20),
          _buildTextField( contentController, "Nội dung"),
        ],
      )
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
