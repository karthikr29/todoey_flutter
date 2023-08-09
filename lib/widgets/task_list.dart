import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, Widget? child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final taskItem = taskData.tasks[index];
            return TaskTile(
              isChecked: taskItem.isDone,
              taskTitle: taskItem.name,
              checkboxCallback: (bool? currentCheckboxState) {
                taskData.updateTask(taskItem);
              },
              longPressCallback: () {
                taskData.deleteTask(taskItem);
              },
            );
          },
        );
      },
    );
  }
}
