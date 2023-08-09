import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  bool isChecked = false;
  String taskTitle = '';
  final Function(bool?) checkboxCallback;
  final VoidCallback longPressCallback;

  TaskTile(
      {super.key,
      required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallback,
        // onChanged: (?){},
        // toggleCheckboxState,
        value: isChecked,
      ),
    );
  }
}
