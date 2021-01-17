import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey/Models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Bread'),
    Task(name: 'Buy Pepsi'),
    Task(name: 'Go to Work'),
  ];
  int get taskCount {
    return _tasks.length;
  }

  void addNewTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
