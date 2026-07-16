import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:w6_practice/login.dart';

import '../../model/auth_session.dart';

class AuthenticationService {
  static AuthenticationService instance = AuthenticationService();

  AuthSession? session;

  bool get isLoggedIn => session != null;

  Future<void> login({required String name, required String password}) async {
    final Uri baseUri = Uri.parse("http://localhost:3000");
    final Uri loginUrl = baseUri.replace(path: "login");

    // 1- Create the JSON body with the name and password
    Map<String, dynamic> body = {"name": name, "password": password};

    // 2- Fetch the POST/login
    final response = await http.post(
      loginUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    // 3- Decode the json
    Map<String, dynamic> decode = jsonDecode(response.body);

    // 4 - If failed, throw a AuthException
    if (response.statusCode != 200) {
      throw AuthException("Invalid credentials");
    }
    // 5 -  Get the token
    final String token = decode["token"];
    // 5 -  Get the user
    final User user = User.fromJson(decode["user"]);

    // 6 - Update the session
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
