import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/auth_session.dart';
import '../../model/user.dart';

class AuthenticationService {
  static AuthenticationService instance = AuthenticationService();

  AuthSession? session;

  bool get isLoggedIn => session != null;

  Future<void> login({required String name, required String password}) async {
    final Uri baseUri = Uri.parse("http://localhost:3000");
    final Uri loginUrl = baseUri.replace(path: "login");

    // 1 Create JSON body
    Map<String, dynamic> body = {"name": name, "password": password};

    // 2 POST /login
    final response = await http.post(
      loginUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    // 3 Decode JSON
    Map<String, dynamic> decode = jsonDecode(response.body);

    // 4 Handle error
    if (response.statusCode != 200) {
      throw AuthException(decode["error"] ?? "Invalid credentials");
    }

    // 5 Get token
    final String token = decode["token"];

    // 5 Get user
    final User user = User.fromJSon(decode["user"]);

    // 6 Update session
    session = AuthSession(user: user, token: token);
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    return message;
  }
}