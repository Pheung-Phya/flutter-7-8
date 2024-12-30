import 'dart:convert';

import 'package:local_storage1/local_shared_pre/model/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoController {
  Future<void> _insert(Todo todo) async {
    final pref = await SharedPreferences.getInstance();
    final List<String> todos = pref.getStringList('todos') ?? [];

    todos.add(json.encode({
      'title': todo.title,
      'description': todo.description,
      'id': todo.dateTime.toIso8601String()
    }));

    pref.setStringList('todos', todos);
  }

  Future<List<Todo>> getTodo() async {
    final pref = await SharedPreferences.getInstance();
    final List<String> todosJson = pref.getStringList('todos') ?? [];
    List<Todo> todoList = [];

    for (var map in todosJson) {
      try {
        Map<String, dynamic> todoMap = json.decode(map);
        todoList.add(Todo(
            title: todoMap['title'],
            description: todoMap['description'],
            dateTime: DateTime.parse(todoMap['dateTime'])));
      } catch (e) {
        print(e);
      }
    }
    return todoList;
  }
}
