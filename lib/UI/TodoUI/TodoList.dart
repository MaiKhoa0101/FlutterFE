import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../hive/hivefunction.dart';
import '../../models/taskList.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<TaskItem> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    tasks = HiveFunctions.getAllTask();
    setState(() {});
  }

  Future<void> _onRefresh() => _loadTasks();

  Future<void> _createTask() async {
    HiveFunctions.createTask('Tiêu đề mới', 'Nội dung mới');
    await _loadTasks();
  }

  Future<void> _deleteAllTasks() async {
    HiveFunctions.deleteAllTask();
    await _loadTasks();
  }

  Future<void> _deleteTask(int key) async {
    HiveFunctions.deleteTask(key);
    await _loadTasks();
  }

  Future<void> _goToDetail(TaskItem item) async {
    final updated = await context.push('/detailTask', extra: item);
    if (updated == true) {
      await _loadTasks(); // Reload nếu có cập nhật
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFABs(),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: tasks.isEmpty
            ? const Center(child: Text('Không có công việc nào.'))
            : ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) =>
              _buildTaskTile(tasks[index]),
        ),
      ),
    );
  }

  Widget _buildFABs() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'add',
          onPressed: _createTask,
          child: const Icon(Icons.add),
          tooltip: 'Tạo công việc mới',
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          heroTag: 'deleteAll',
          onPressed: _deleteAllTasks,
          backgroundColor: Colors.red,
          child: const Icon(Icons.delete_forever),
          tooltip: 'Xoá tất cả',
        ),
      ],
    );
  }

  Widget _buildTaskTile(TaskItem item) {
    return Column(
      children: [
        const Divider(height: 1, color: Colors.grey),
        ListTile(
          title: Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            item.content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () => _goToDetail(item),
          trailing: PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'delete') _deleteTask(item.key!);
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'delete',
                child: Text('Xoá'),
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: Colors.grey),
      ],
    );
  }
}
