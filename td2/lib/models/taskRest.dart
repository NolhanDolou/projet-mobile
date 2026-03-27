
import 'dart:convert';

import 'package:http/http.dart' as http;

class TaskRest {
  int userId;
  int id;
  String title;
  bool completed;

  TaskRest({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed
  });



  factory TaskRest.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'userId': int userId, 'id': int id, 'title': String title, 'completed': bool completed} =>
          TaskRest(
              userId: userId,
              id: id,
              title: title,
              completed: completed
          ),
      _ => throw const FormatException('Failed to load task.'),
    };
  }

}