import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import '../services/task_service.dart';

class AddTaskScreen extends StatefulWidget {
  final ParseObject? task;

  const AddTaskScreen({Key? key, this.task}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // If editing, pre-fill the text field
    if (widget.task != null) {
      titleController.text = widget.task!.get<String>('title') ?? '';
    }
  }

  Future<void> saveTask() async {
    if (titleController.text.trim().isEmpty) return;

    if (widget.task == null) {
      // CREATE new task
      await TaskService.addTask(titleController.text.trim());
    } else {
      // UPDATE existing task
      widget.task!.set('title', titleController.text.trim());
      await widget.task!.save();
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.task != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edit Task" : "Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Task Title",
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveTask,
                child: Text(isEditing ? "Update Task" : "Add Task"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}