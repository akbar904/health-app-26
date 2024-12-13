import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:my_app/models/todo.dart';
import 'package:my_app/services/todo_service.dart';

class HomeViewModel extends BaseViewModel {
  final _todoService = locator<TodoService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  List<Todo> get todos => _todoService.todos;

  Future<void> showAddTodoSheet() async {
    await _bottomSheetService.showBottomSheet(
      title: 'Add Todo',
      description: 'Enter the todo details below',
    );
    rebuildUi();
  }

  Future<void> deleteTodo(String id) async {
    final response = await _dialogService.showDialog(
      title: 'Delete Todo',
      description: 'Are you sure you want to delete this todo?',
      dialogPriority: DialogPriority.high,
    );

    if (response?.confirmed ?? false) {
      _todoService.removeTodo(id);
      rebuildUi();
    }
  }

  void toggleTodo(String id) {
    _todoService.toggleTodoCompletion(id);
    rebuildUi();
  }
}
