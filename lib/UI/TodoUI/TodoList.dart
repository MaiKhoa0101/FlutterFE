import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../state management/bloc_task.dart';
import '../../dependency injections/locator.dart';
import '../../models/taskList.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFABs(context),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TaskLoaded) {
            final tasks = state.tasks;
            return RefreshIndicator(
              onRefresh: () async {
                context.read<TaskBloc>().add(LoadTasks());
              },
              child: tasks.isEmpty
                  ? const Center(child: Text('Không có công việc nào.'))
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) =>
                          _buildTaskTile(context, tasks[index]),
                    ),
            );
          } else if (state is TaskError) {
            return Center(child: Text('Lỗi: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildFABs(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'add',
          onPressed: () {
            context.read<TaskBloc>().add(AddTask('Tiêu đề mới', 'Nội dung mới'));
          },
          child: const Icon(Icons.add),
          tooltip: 'Tạo công việc mới',
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          heroTag: 'deleteAll',
          onPressed: () {
            context.read<TaskBloc>().add(DeleteAllTasks());
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.delete_forever),
          tooltip: 'Xoá tất cả',
        ),
      ],
    );
  }

  Widget _buildTaskTile(BuildContext context, TaskItem item) {
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
          onTap: () async {
            final updated = await context.push('/detailTask', extra: item);
            if (updated == true) {
              context.read<TaskBloc>().add(LoadTasks());
            }
          },
          trailing: PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'delete') {
                context.read<TaskBloc>().add(DeleteTask(item.key!));
              }
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
