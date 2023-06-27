
import 'package:flutter/foundation.dart';

class Task with ChangeNotifier {
  late final String id;
  late final String title;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    this.isDone = false,
});
  void toggleDoneStatus() {
    isDone = !isDone;
    notifyListeners();
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
    };
  }
}