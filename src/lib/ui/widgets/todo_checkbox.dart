import 'package:flutter/material.dart';
import 'package:my_app/ui/common/app_colors.dart';

class TodoCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;

  const TodoCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: kcPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
