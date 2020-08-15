import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_tile.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = context.watch<TaskData>().tasks[index];
        return TaskTile(
          taskTitle: task.name,
          isChecked: task.isDone,
          checkBoxCallBack: (bool checkBoxState) {
            setState(() {
              //setState destroys and redraw the TaskTile
              //isDone Value gets toggled so widgets using isDone property of
              //Task class gets updated
              //Since TaskTile is stateless so they get redrawn by destroying
              //previous draw
              //function calling neads read
              context.read<TaskData>().tasks[index].toggleDone();
            });
          },
          onLongPressCallBack: () {
            setState(() {
              context.read<TaskData>().deleteTask(task);
            });
          },
        );
      },
      itemCount: context.watch<TaskData>().getTaskLength(),
    );
  }
}
