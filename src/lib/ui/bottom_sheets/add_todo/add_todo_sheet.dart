import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/ui/common/ui_helpers.dart';
import 'package:my_app/ui/bottom_sheets/add_todo/add_todo_viewmodel.dart';

class AddTodoSheet extends StackedView<AddTodoViewModel> {
  const AddTodoSheet({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddTodoViewModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add New Todo',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          verticalSpaceMedium,
          TextField(
            controller: viewModel.todoController,
            decoration: InputDecoration(
              hintText: 'Enter todo title',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kcPrimaryColor),
              ),
            ),
          ),
          verticalSpaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancel'),
              ),
              horizontalSpaceSmall,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kcPrimaryColor,
                ),
                onPressed: viewModel.addTodo,
                child: Text(
                  'Add Todo',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  AddTodoViewModel viewModelBuilder(context) => AddTodoViewModel();
}
