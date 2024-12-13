import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:my_app/features/home/home_viewmodel.dart';
import 'package:my_app/features/home/widgets/todo_item.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/ui/common/ui_helpers.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        title: const Text('Todo App'),
        backgroundColor: kcPrimaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.showAddTodoSheet,
        backgroundColor: kcPrimaryColor,
        child: const Icon(Icons.add),
      ),
      body: viewModel.todos.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.note_add_outlined,
                    size: 48,
                    color: Colors.white54,
                  ),
                  verticalSpaceSmall,
                  const Text(
                    'No todos yet\nTap + to add a new todo',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: viewModel.todos.length,
              itemBuilder: (context, index) {
                final todo = viewModel.todos[index];
                return TodoItem(
                  todo: todo,
                  onToggle: (value) => viewModel.toggleTodo(todo.id),
                  onDelete: () => viewModel.deleteTodo(todo.id),
                );
              },
            ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(context) => HomeViewModel();
}
