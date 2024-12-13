import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:my_app/models/todo.dart';
import 'package:my_app/services/todo_service.dart';

class AddTodoViewModel extends BaseViewModel {
  final _todoService = locator<TodoService>();
  final todoController = TextEditingController();

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  void addTodo() {
    if (todoController.text.trim().isEmpty) return;

    final todo = Todo(
      id: DateTime.now().toIso8601String(),
      title: todoController.text.trim(),
      createdAt: DateTime.now(),
    );

    _todoService.addTodo(todo);
    todoController.clear();
    rebuildUi();
  }
}
