import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import './task.dart';

class Tasks with ChangeNotifier {
  List<Task> _items = [];

  List<Task> get items {
    return [..._items];
  }

  List<Task> get isDone {
    return _items.where((task) => task.isDone).toList();
  }

  List<Task> get isNotDone {
    return _items.where((task) => !task.isDone).toList();
  }

  Task findById(String id) {
    return _items.firstWhere((task) => task.id == id);
  }

  void addTask(Task task) {
    _items.add(task);
    notifyListeners();

    saveTasksToLocal();
    print("add");
  }

  void deleteTask(String id) {
    _items.removeWhere((task) => task.id == id);
    notifyListeners();
    saveTasksToLocal();
    print("delete");
  }

  Future<void> loadTasksFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getString('tasks');
    if (tasksJson != null) {
      final List<dynamic> decodedJson = json.decode(tasksJson);
      _items = decodedJson.map((taskJson) {
        return Task(
          id: taskJson['id'],
          title: taskJson['title'],
          isDone: taskJson['isDone'],
        );
      }).toList();
      print(_items);
    }
    notifyListeners();

    print("load");
  }

  Future<void> saveTasksToLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final tasksJson = json.encode(_items.map((task) => task.toJson()).toList());
    prefs.setString('tasks', tasksJson);
    print("Save");
    print(_items);

  }

}
