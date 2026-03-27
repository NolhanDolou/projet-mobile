import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/taskRest.dart';
import 'package:http/http.dart' as http;



class MyApiRest{
  Future<List<TaskRest>> fetchTasks() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      /*
      return TaskRest.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
          */

      final List<dynamic> json = jsonDecode(response.body);
      final todos = <TaskRest>[];
      for (var elem in json){
        todos.add(TaskRest.fromJson(elem));
      }
        return todos;

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load task');
    }
  }



}