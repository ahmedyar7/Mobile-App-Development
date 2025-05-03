import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos.where((todo) => !todo.isCompleted).toList();
  List<Todo> get completedTodos =>
      _todos.where((todo) => todo.isCompleted).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void toggleTodo(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].toggleComplete();
      notifyListeners();
    }
  }

  void updateTodo(String id, String newTitle) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].title = newTitle;
      notifyListeners();
    }
  }
}
