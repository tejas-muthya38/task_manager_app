import 'package:flutter/material.dart';
import '../services/task_service.dart';
import '../services/auth_service.dart';
import '../widgets/task_item.dart';
import '../widgets/timer_widget.dart';
import 'add_task_screen.dart';
import 'login_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ParseObject> tasks = [];

  void loadTasks() async {
    tasks = await TaskService.getTasks();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  void logout() async {
    await AuthService.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pomodoro Tasks"),
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TimerWidget(),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: tasks
                    .map((task) => TaskItem(task, loadTasks))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddTaskScreen()),
          );
          loadTasks();
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
