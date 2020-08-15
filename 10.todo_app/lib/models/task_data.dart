import 'package:flutter/foundation.dart';
import 'package:todo_app/models/task.dart';

class TaskData with ChangeNotifier, DiagnosticableTreeMixin {
  List<Task> tasks = [];

  void addNewTask(String newTaskTitle) {
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  int getTaskLength() {
    return tasks.length;
  }

  void deleteTask(Task taskToDelete) {
    tasks.remove(taskToDelete);
    notifyListeners();
  }
}
