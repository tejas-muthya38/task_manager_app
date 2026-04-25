import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import '../services/task_service.dart';
import '../screens/add_task_screen.dart';

class TaskItem extends StatelessWidget {
  final ParseObject task;
  final VoidCallback refresh;

  TaskItem(this.task, this.refresh);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          task.get<String>('title') ?? '',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            decoration: (task.get<bool>('completed') ?? false)
                ? TextDecoration.lineThrough
                : null,
            color: (task.get<bool>('completed') ?? false)
                ? Colors.grey
                : Colors.black,
          ),
        ),
        leading: Checkbox(
          value: task.get<bool>('completed') ?? false,
          onChanged: (_) async {
            await TaskService.toggleTask(task);
            refresh();
          },
        ),

        // 👇 NEW: Edit + Delete buttons
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddTaskScreen(task: task)),
                ).then((_) => refresh());
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
                await TaskService.deleteTask(task);
                refresh();
              },
            ),
          ],
        ),
      ),
    );
  }
}
