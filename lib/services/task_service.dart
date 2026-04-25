import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class TaskService {
  static Future<List<ParseObject>> getTasks() async {
    final user = await ParseUser.currentUser();
    final query = QueryBuilder(ParseObject('Task'))
      ..whereEqualTo('user', user);

    final response = await query.query();
    if (response.success && response.results != null) {
      return response.results as List<ParseObject>;
    }
    return [];
  }

  static Future<void> addTask(String title) async {
    final user = await ParseUser.currentUser();
    final task = ParseObject('Task')
      ..set('title', title)
      ..set('completed', false)
      ..set('user', user);

    await task.save();
  }

  static Future<void> toggleTask(ParseObject task) async {
    task.set('completed', !(task.get<bool>('completed') ?? false));
    await task.save();
  }

  static Future<void> deleteTask(ParseObject task) async {
    await task.delete();
  }
}