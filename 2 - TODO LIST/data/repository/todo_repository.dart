import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:w6_practice/w9_1_STARTCODE/1%20-%20START%20CODE/2%20-%20TODO%20LIST/data/dto/todo_dto.dart';
import 'package:w6_practice/w9_1_STARTCODE/1%20-%20START%20CODE/2%20-%20TODO%20LIST/data/repository/repository_exception.dart';

import '../../models/todo.dart';

class TodoRepository {
  static final global = TodoRepository(); // unique instance

  final List<Todo> fakeTodos = [
    Todo(id: '1', title: 'Buy groceries', completed: false),
    Todo(id: '2', title: 'Finish Flutter homework', completed: true),
    Todo(id: '3', title: 'Call the dentist', completed: false),
    Todo(id: '4', title: 'Read 20 pages of a book', completed: true),
    Todo(id: '5', title: 'Go for a 30-minute walk', completed: false),
  ];

  Future<List<Todo>> getTodos() async {
    //  TODO
    //  Adapt the code to handle firebase data fetch
    //
    const url =
        "https://todolistdata-13e78-default-rtdb.asia-southeast1.firebasedatabase.app/todo.json";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw RepositoryException("Failed to load todos");
    }

    final Map<String, dynamic> data = jsonDecode(response.body);

    return data.entries.where((entry) => entry.value != null).map((entry) {
      return TodoDto.fromJson(
        entry.key,
        Map<String, dynamic>.from(entry.value),
      );
    }).toList();
  }

  Future<void> updateCompleted(String todoId, bool completed) async {
    //  TODO
    //  Adapt the code to handle firebase data fetch
    //
    final url =
        "https://todolistdata-13e78-default-rtdb.asia-southeast1.firebasedatabase.app/todo/$todoId.json";
    final response = await http.patch(
      Uri.parse(url),
      body: jsonEncode({"completed": completed}),
    );
    if (response.statusCode != 200) {
      throw RepositoryException("Failed to update todo");
    }

    

   
  }
}
