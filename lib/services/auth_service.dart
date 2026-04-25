import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AuthService {
  static Future<bool> login(String email, String password) async {
    final user = ParseUser(email, password, null);
    final response = await user.login();
    return response.success;
  }

  static Future<bool> register(String email, String password) async {
    final user = ParseUser(email, password, email);
    final response = await user.signUp();
    return response.success;
  }

  static Future<void> logout() async {
    final user = await ParseUser.currentUser();
    await user?.logout();
  }
}